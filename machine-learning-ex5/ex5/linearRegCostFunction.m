function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
unreg_cost = (1/(2*m))*sum((X*theta - y).^2);
J = unreg_cost + (lambda/(2*m))*(sum(theta.^2 )-theta(1)^2);

for i=1: size(theta),
  grad(i) = (1/m).*sum(((X*theta - y).*X(:,i)));
  if i != 1,
    grad(i) = grad(i) + lambda/m*theta(i);
  end
end





% =========================================================================

grad = grad(:);

end
