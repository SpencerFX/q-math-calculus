/ Function to compute the numerical gradient
/ Inputs:
/ func: The function for which the gradient is computed
/ point: A list of values representing the point at which the gradient is computed
/ h: A small step size (default is 1e-5)
gradient:{[func; point; h]
  / Initialize the gradient vector
  grad:point*0;
  / Loop through each dimension
  n:count point;
  do[n; {
    / Create a unit vector with a small step in the current dimension
    delta:point*0;
    delta[x]:h;
    / Compute the partial derivative using finite difference
    grad[x]:(func[point+delta]-func[point])/h;
  }];
  grad
 };

/ Example function: f(x, y) = x^2 + y^2
f:{x[0]*x[0] + x[1]*x[1]}

/ Point at which to calculate the gradient (e.g., [1, 2])
point:1 2

/ Step size
h:1e-5

/ Compute the gradient
result:gradient[f; point; h]
result