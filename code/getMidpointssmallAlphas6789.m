function [midrowpleatue,midrowconverged] = getMidpointssmallAlphas6789(array)

% midpoint pleatue 
indicespleatue = [];
[indicespleatue] = movingaveragepleatueSmallerAlpha6789(array,indicespleatue);
midrowpleatue = indicespleatue(ceil(end/2), :);

% midpoint converged state

indicesconverged = [];
[indicesconverged] = movingaverageconvergeSmallerAlpha6789(array,indicesconverged);
midrowconverged = indicesconverged(ceil(end/2), :);

end

