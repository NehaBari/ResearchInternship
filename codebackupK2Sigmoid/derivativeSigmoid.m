function [derivative] = derivativeSigmoid(local_potential)
a = (local_potential^2)/2;
derivative = (2/pi) * exp(-a);
end
