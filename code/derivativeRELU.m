function [derivative] = derivativeRELU(local_potential)

if local_potential>0
    derivative = 1;
else
    derivative = 0;
end

end

