function [derivative] = derivativeRELU(local_potential,N)
local_potential = local_potential * sqrt(N);
if local_potential>0
    derivative = 1;
else
    derivative = 0;
end

end

