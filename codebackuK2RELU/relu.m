function [gx] = relu(x)
    if x>0
       gx = x;
    else
       gx = 0;
    end 
end

