
function [indices] = movingaverageconvergeSmallerAlpha6789(array,indices)

    movingavergearray = movmean(array,150);
%     
    outofbound = [];
     rows = length(movingavergearray(:,1));
      for i=1:rows
       
            %original alpha 6
            if(movingavergearray(i) >=0.00025 && movingavergearray(i) <=0.003)
            % alpha 7 8 and 9
            %if(movingavergearray(i) >=0.00025 && movingavergearray(i) <=0.004)
            %if(movingavergearray(i) >=0.00025 && movingavergearray(i) <=0.001)
             indices = [indices;i];
          
          
          else
              outofbound = [outofbound;i];
              
              
            end
      end
    
%     
end

