function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i=1:size(theta),
  val1 = (-1.*y).*log(sigmoid(X*theta));
  val2 = (1.-y).* log(1.- sigmoid(X*theta));
  % Cost calculation
  intermediateCost = (1/m).*sum(val1-val2);
  
  % gradient values
  intermediateGrad = (1/m).*sum((sigmoid(X*theta)-y).*X(:,i));
  if i==1,
    J = intermediateCost;
    grad(i) = intermediateGrad;
  else
    % regularized cost calculation
    J =intermediateCost + (lambda/(2*m))*(sum(theta.^2) - theta(1)^2);
    
    % regularized gradient calculation
    grad(i) = intermediateGrad .+ (lambda/m).*theta(i);
  end
 
end




% =============================================================

end
