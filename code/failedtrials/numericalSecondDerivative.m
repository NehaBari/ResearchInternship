function [fd,sd] = numericalSecondDerivative(vals)

fd = zeros(size(vals));
sd = zeros(size(vals));
len_vals = length(vals);
for i = 1:len_vals

    if (i ==1)
        fd(i) = NaN;
        sd(i) = NaN;
    elseif(i==2)
        sd(i) = NaN;
        fd(i) = (vals(i)-vals(i-1));
    else
        fd(i) = (vals(i)-vals(i-1));
        if (i==len_vals)
            sd(i) = NaN;
        else
        sd(i) = vals(i+1)+vals(i-1)-2*vals(i);
        end
   end
        

end


end

