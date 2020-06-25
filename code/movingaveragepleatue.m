
function [indices,outofbound,movingavergearray] = movingaveragepleatue(array,indices)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    movingavergearray = movmean(array,250);
%     
    outofbound = [];
     threshold = 0.002;
     rows = length(movingavergearray(:,1));
      for i=1:rows
          rows
          if(movingavergearray(i) >=0.043 & movingavergearray(i) <=0.056)
             indices = [indices;i];
          
          
          else
              outofbound = [outofbound;i];
              
              
          end
      end
    
%     
end

