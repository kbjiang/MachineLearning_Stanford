function [error_train, error_val] = ...
    learningCurveRandom(X, y, Xval, yval, lambda)

% see learningCurve.m
% see optional exercise 3.5 in ex5.pdf

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ---------------------- Sample Solution ----------------------


for i = 1:m
  for j = 1:50
    elm = randperm(m, i);

    theta = trainLinearReg(X(elm, :), y(elm), lambda);
 
    error_train(i) = error_train(i) + linearRegCostFunction(X(elm, :), y(elm), theta, 0);
    
    error_val(i) = error_val(i) + linearRegCostFunction(Xval, yval, theta, 0);

  end
  
  error_train(i) = error_train(i)/50;
  error_val(i) = error_val(i)/50;
end
    




% -------------------------------------------------------------

% =========================================================================

end
