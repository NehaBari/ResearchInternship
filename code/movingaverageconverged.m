function [indicescon] = movingaverageconverged(array,indicescon)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    movingavergearray = movmean(array,250);
%     
    outofbound = [];
     rows = length(movingavergearray(:,1));
      for i=1:rows
          rows
          if(movingavergearray(i) <= (0.004) && movingavergearray(i) >=(2.9086e-04))
             indicescon = [indicescon;i];
          
          
          else
              outofboundconverged = [outofbound;i];
              
              
          end
      end
    
%     
end

