function [midrowpleatue,midrowconverged] = getMidpointsBigAlphas(array)

% midpoint pleatue 
indicespleatue = [];
[indicespleatue] = movingaveragePleatueBigAlphas(array,indicespleatue);
%[indicespleatue] = movingaveragepleatuesmalleralpha(array,indicespleatue);
midrowpleatue = indicespleatue(ceil(end/2), :);

% midpoint converged state

indicesconverged = [];
 [indicesconverged] = movingaverageconvergedBigAlphas(array,indicesconverged);
%[indicesconverged] = movingaveragepleatuesmalleralpha(array,indicesconverged);
midrowconverged = indicesconverged(ceil(end/2), :);

end

