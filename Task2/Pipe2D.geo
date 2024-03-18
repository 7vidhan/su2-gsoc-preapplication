// Gmsh project created on Wed Mar 13 00:45:34 2024
//+
length = 5.0;
breadth = 0.5;
nx = 81;
ny = 31;

Point(1) = {0, 0.0, 0, 1.0};
Point(2) = {length, 0.0, 0, 1.0};
Point(3) = {length, breadth, 0, 1.0};
Point(4) = {0, breadth, 0, 1.0};

Line(1) = {4, 1}; Transfinite Curve {1} = ny Using Progression 1.03;
Line(2) = {1, 2}; Transfinite Curve {2} = nx Using Progression 1;
Line(3) = {2, 3}; Transfinite Curve {-3} = ny Using Progression 1.03;
Line(4) = {3, 4}; Transfinite Curve {4} = nx Using Progression 1;

Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};
Physical Surface("fluid", 1) = {1};

Compound Curve {2,4};
Compound Curve {1,3};

Transfinite Surface {1};

Physical Curve("inlet", 5) = {1};
Physical Curve("outlet", 6) = {3};
Physical Curve("wall", 7) = {4};
Physical Curve("symmetry", 8) = {2};

// Generate mesh
Mesh.ElementOrder = 1; // Quadratic elements
Mesh.ElementOrderBound = 1; // Linear elements on boundaries
Mesh.RecombineAll = 1; // Recombine elements
Mesh 2;

// Export mesh in SU2 format
//Mesh.MeshFormat = 2;