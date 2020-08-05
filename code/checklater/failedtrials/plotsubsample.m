[fdash,fdoubledash,fnew] = derivativeFunction(gen_error');
figure(1)
d = 1:size(fnew,1);
%plot(d,fnew)
hold on
%plot(d,fdash)
yline(0)
plot(d,fdoubledash')
%legend('subsample','1st derivative','2st derivative');

