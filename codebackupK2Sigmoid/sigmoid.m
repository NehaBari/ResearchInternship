function [gx] = sigmoid(local_potential)
a = local_potential/sqrt(2);
gx = 1 + erf(a);
end

