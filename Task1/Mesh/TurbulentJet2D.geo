// Gmsh project created on Thu Mar  7 16:04:42 2024
res = 1.0;
grad = 1.04;

Point(1) = {0, 0, 0, res};
Point(2) = {1,0,0,res};
Point(3) = {1, 0.105, 0, res};
Point(4) = {1, 0.305, 0, res};
Point(5) = {0, 0.205, 0, res};
Point(6) = {0, 0.005, 0, res};

//+
Line(1) = {1, 2}; Transfinite Curve {1} = 120 Using Progression grad;
Line(2) = {2, 3}; Transfinite Curve {2} = 30 Using Progression 1;
Line(3) = {3, 4}; Transfinite Curve {3} = 30 Using Progression 1;
Line(4) = {4, 5}; Transfinite Curve {4} = 120 Using Progression 1;
Line(5) = {5, 6}; Transfinite Curve {5} = 30 Using Progression 1;
Line(6) = {6, 1}; Transfinite Curve {6} = 30 Using Progression 1;
Line(7) = {6, 3}; Transfinite Curve {7} = 120 Using Progression grad;

Physical Curve("inlet", 8) = {6};
Physical Curve("ambient", 9) = {4, 3, 2};
Physical Curve("axis", 10) = {1};
Physical Curve("left", 11) = {5};

Curve Loop(1) = {1, 2, -7, 6};
Plane Surface(1) = {1};

Curve Loop(2) = {7, 3, 4, 5};
Plane Surface(2) = {2};

Compound Curve {5, 3};
Compound Curve {6, 2};
Compound Curve {4, 7, 1};

Transfinite Surface {1};
Transfinite Surface {2};

Recombine Surface {1,2};

// Generate mesh
Mesh.ElementOrder = 2; // Quadratic elements
Mesh.ElementOrderBound = 1; // Linear elements on boundaries
Mesh.RecombineAll = 1; // Recombine elements
Mesh 2;
