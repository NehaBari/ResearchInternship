function [fdash,fdoubledash,fnew] = derivativeFunction(f,windowsize,smoothing_window)
    f = f/f(2);

    points = floor(length(f)/windowsize);
    fnew = zeros(points,1);
    for i = 1:points
        % subsampled points
        % 1st and 2nd derivative are calculated on this subsampled data
        fnew(i) = f(windowsize*i);
    end
    
    fdash = [NaN;diff(fnew)];
   % fdoubledash = [NaN;NaN;(diff(fnew(2:end))-diff([fnew(3:end);NaN]))];
    %fdash= fdash/fdash(2);
    %fdoubledash = fdoubledash/fdoubledash(4);
    fdoubledash = [NaN;diff(fdash)];
    fdash = smoothdata(fdash,'sgolay',smoothing_window);
    fdoubledash = smoothdata(fdoubledash,'sgolay',smoothing_window);
    
end

