import sys
from optparse import OptionParser
import pysu2
import numpy as np

def main():
    # Command line options
    parser=OptionParser()
    parser.add_option("-f", "--file", dest="filename", help="Read config from FILE", metavar="FILE")
    parser.add_option("--parallel", action="store_true",
                        help="Specify if we need to initialize MPI", dest="with_MPI", default=False)

    (options, args) = parser.parse_args()
    options.nDim = int(2)
    options.nZone = int(1)

    # Import mpi4py for parallel run
    if options.with_MPI == True:
        from mpi4py import MPI
        comm = MPI.COMM_WORLD
        rank = comm.Get_rank()
    else:
        comm = 0
        rank = 0

    # Initialize the corresponding driver of SU2, this includes solver preprocessing
    try:
        SU2Driver = pysu2.CSinglezoneDriver(options.filename, options.nZone, comm);
    except TypeError as exception:
        print('A TypeError occured in pysu2.CDriver : ',exception)
        if options.with_MPI == True:
            print('ERROR : You are trying to initialize MPI with a serial build of the wrapper. Please, remove the --parallel option that is incompatible with a serial build.')
        else:
            print('ERROR : You are trying to launch a computation without initializing MPI but the wrapper has been built in parallel. Please add the --parallel option in order to initialize MPI for the wrapper.')
        return


    MarkerID  = None
    MarkerName = 'wall'
    MarkerList =  SU2Driver.GetMarkerTags()

    allMarkerIDs = SU2Driver.GetMarkerIndices()

    if MarkerName in MarkerList and MarkerName in allMarkerIDs.keys():
        MarkerID  = allMarkerIDs[MarkerName]

    nVertex_Marker = 0    


    if MarkerID  != None:
        nVertex_Marker = SU2Driver.GetNumberMarkerNodes(MarkerID )
    
    if rank == 0:
        print("\n------------------------------ Begin Solver -----------------------------\n")
    sys.stdout.flush()
    if options.with_MPI == True:
        comm.Barrier()

    wall_temperature_amplitude = 20.0  
    wall_temperature_mean = 302.4 
    newTemp=0
    for iVertex in range(nVertex_Marker):
        MarkerCoords = SU2Driver.MarkerCoordinates(MarkerID)
        x = MarkerCoords(iVertex, 0)
        newTemp = wall_temperature_mean + np.sin(2*np.pi*x)*wall_temperature_amplitude
        SU2Driver.SetMarkerCustomTemperature(MarkerID, iVertex, newTemp)

    SU2Driver.Postprocess()
    SU2Driver.BoundaryConditionsUpdate()
    SU2Driver.Run()
    SU2Driver.Update()
    SU2Driver.Monitor(0)
    SU2Driver.Output(0)
    SU2Driver.Finalize()

if __name__ == '__main__':
    main()
