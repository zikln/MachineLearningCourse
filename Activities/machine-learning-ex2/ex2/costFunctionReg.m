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

J = ( -y'*log(sigmoid(X*theta))  - (1-y)'  *log(1-sigmoid(X*theta)))/m + (lambda/(2*m))*sum(theta(2:length(theta),1) .^ 2);


grad_1 = (sum((sigmoid(X*theta)-y) .* X(:,1)))/m;
grad_2 = (sum((sigmoid(X*theta)-y) .* X(:,2:length(theta))))/m;
grad_2 = grad_2 + (lambda/m)* theta(2:length(theta))'; 
grad = [grad_1, grad_2];


%grad_1(1) = (sum((sigmoid(X(:,1)*theta(1:length(theta)))-y) .* X(:,1)))/m;
%grad(2:length(grad)) = (sum((sigmoid(X(2:m,:)*theta(2:length(theta)))-y(2:m,1)) .* X()))/m + (lambda/m)*theta(2:length(theta))';







% =============================================================

end
