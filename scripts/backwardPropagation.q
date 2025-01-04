// Feed-forward related code
// Example usage
// z:2.0
// sigmoid_result:sigma[z]
// dsigmoid_result:d_sigma[z]

/ Sigmoid function: sigma(z) = 1 / (1 + exp(-z))
sigma:{1 % (1 + exp -x)}

/ Derivative of sigmoid: d_sigma(z) = (cosh(z/2))^(-2) / 4
d_sigma:{(cosh[x % 2] xexp -2) % 4}

/ Function to reset the network with specified structure
reset_network:{
    / Parameters
    n1:n1?6;  / Default to 6 if not provided
    n2:n2?7;  / Default to 7 if not provided

    / Randomly initialize weights and biases
    W1:(n1 1)?-0.5f + 1f?1.0f;   / Random matrix (n1 x 1) scaled by 1/2
    W2:(n2 n1)?-0.5f + 1f?1.0f;  / Random matrix (n2 x n1) scaled by 1/2
    W3:(2 n2)?-0.5f + 1f?1.0f;   / Random matrix (2 x n2) scaled by 1/2

    b1:(n1 1)?-0.5f + 1f?1.0f;   / Random bias vector (n1 x 1) scaled by 1/2
    b2:(n2 1)?-0.5f + 1f?1.0f;   / Random bias vector (n2 x 1) scaled by 1/2
    b3:(2 1)?-0.5f + 1f?1.0f;    / Random bias vector (2 x 1) scaled by 1/2

    / Return the initialized weights and biases as a dictionary
    (`W1`W2`W3`b1`b2`b3)!(W1; W2; W3; b1; b2; b3)
 }; 

/ Function to feed forward through the network
/ Inputs:
/ a0: Initial activations for the input layer
/ Returns:
/ List containing (a0, z1, a1, z2, a2, z3, a3)
network_function:{
    / Layer 1 computations
    z1:W1 mmu a0 + b1;   / Weighted sum: W1 @ a0 + b1
    a1:sigma z1;         / Activation: sigma(z1)

    / Layer 2 computations
    z2:W2 mmu a1 + b2;   / Weighted sum: W2 @ a1 + b2
    a2:sigma z2;         / Activation: sigma(z2)

    / Layer 3 computations
    z3:W3 mmu a2 + b3;   / Weighted sum: W3 @ a2 + b3
    a3:sigma z3;         / Activation: sigma(z3)

    / Return all activations and weighted sums
    (a0; z1; a1; z2; a2; z3; a3)
 };