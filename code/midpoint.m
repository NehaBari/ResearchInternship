function [midpointindex,logicalArray] = midpoint(fdoubledash,threshold1,threshold2)

    
    L = length(fdoubledash);
    logicalArray = zeros(L,1);
    for i = 1:L
        if (fdoubledash(i) >= threshold1 && fdoubledash(i) <= threshold2)
            logicalArray(i) = 1
        else
            logicalArray(i) = 0;
        end
    end
    
    
    indices = find(logicalArray == 1);
    % finding the index of the midpoint
    midpointindex = indices(ceil(length(indices)/2));
   

end

