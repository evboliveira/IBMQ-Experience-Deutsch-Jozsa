OPENQASM 2.0;
include "qelib1.inc";

//Implementing the oracle operations:

//Simulating the constant function
gate uf_c a, b, c, d {
  x d;
}
//Simulating the balanced function
gate uf_b a, b, c, d {
  cx a, d;
}

//Defining the quantum and classical registers
qreg x_[3];
qreg func_x[1];
creg class[3];
//--------------------

//Initializing the qbits in the desired quantum states:
id x_[0];
id x_[1];
id x_[2];
x func_x[0];
//--------------------

//Using barriers to separate the code
barrier x_[0];
barrier x_[1];
barrier x_[2];
barrier func_x[0];

//The Deutsch-Jozsa algorithms
h x_[0];
h x_[1];
h x_[2];
h func_x[0];
uf_c x_[0],x_[1],x_[2],func_x[0];
h x_[0];
h x_[1];
h x_[2];
id func_x[0];
//--------------------

//Using barriers to separate the code
barrier x_[0];
barrier x_[1];
barrier x_[2];
barrier func_x[0];

//Measurements:
measure x_[0] -> class[0];
measure x_[1] -> class[1];
measure x_[2] -> class[2];
//--------------------
