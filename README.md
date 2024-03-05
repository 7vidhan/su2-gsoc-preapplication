# SU2 CFD GSoC Application Prep

This repository is dedicated to my preparation for the Google Summer of Code (GSoC) application for SU2 CFD. I will be working on specific tasks outlined in the issues section, and I aim to showcase my proficiency and commitment to contributing to SU2 CFD through this GSoC opportunity.

### Task 1: Compile SU2

- **Objective:** Clone SU2 from GitHub, compile it with various options, and run tutorials.
- **Deliverable:** None

### Task 2: Set up a Test Case from Scratch

- **Objective:** Generate a 2D mesh for an axisymmetric, steady-state, turbulent jet case using Gmsh. Configure the setup, run the simulation, and extract results.
- **Deliverable:** Test case and a brief report (Markdown) covering motivation, configuration options, convergence history, and comparison with experimental values.
- **Reference Paper:** [Investigation of the Mixing Process in an Axisymmetric Turbulent Jet Using PIV and LIF](https://www.researchgate.net/publication/254224677_Investigation_of_the_Mixing_Process_in_an_Axisymmetric_Turbulent_Jet_Using_PIV_and_LIF)

### Task 3: Python Wrapper Test Case

- **Objective:** Set up a problem in the Python wrapper and run a test case using the provided [launch_unsteady_CHT_FlatPlate.py](https://github.com/su2code/SU2/blob/master/TestCases/py_wrapper/flatPlate_unsteady_CHT/launch_unsteady_CHT_FlatPlate.py).
- **Deliverable:** Test case and a concise report describing the test case and results.

### Task 4: Modification of Python Wrapper Setup

- **Objective:** Enable a spatially varying wall temperature for a steady-state compressible turbulent flat plate test case.
- **Deliverable:** Test case and a brief report describing the results.

### Task 5: Addition of New Volume Output

- **Objective:** Add the local speed of sound as computed by SU2 in the volume output (Paraview files) and screen output. Run the turbulent test case from Task 2 with this new output enabled.
- **Deliverable:** Explain your implementation approach, display the history output of the new screen output, and provide images with the volume output.

### Navigation:

- [Issues](link): Detailed task tracking.
- [Documentation](link): Task-related docs.
- [Contact](kashyapvidhan@gmail.com): Reach out for questions or feedback.

I'll be regularly updating this repository to showcase my progress. Thank you for considering my application.
