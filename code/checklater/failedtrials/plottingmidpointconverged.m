
% windowsize =10;
% smoothing_window = 50;
% % threshold1 = 0.03;
% % threshold2 =-0.03;
% threshold1 = 0.02
% threshold2 = 0.06
% [fdash,fdoubledash,fnew] = derivativeFunction(gen_error',windowsize,smoothing_window);
% %[midpointindex] = midpoint(fdoubledash);
% [midpointindex,logicalArray] = midpoint(fdoubledash,threshold1,threshold2);
% 



figure(3)
indicescon = [];
[indicesconverged] = movingaverageconverged(gen_error,indicescon);
x = 1:size(gen_error,1);
plot(x,gen_error)
midrow = indicesconverged(ceil(end/2), :);
xline(midrow)
xlabel('subsampled training steps')
ylabel('subsampled Gen\_error')
legend('gen\_error_converged=',num2str(gen_error(end)));



figure(4)
% Generalization error
subplot(3,1,1);

plot(x',gen_error,'LineWidth',5)
xlabel('training steps')
ylabel('GE')

yline(1,'-','Color','k');
yline(0,'-','Color','k');
xline(midrow)
legend(strcat('gen\_error=',num2str(gen_error(end))))


% order parameter
subplot(3,1,2); 
hold on
plot(x',R_11,'LineWidth',5)
plot(x',R_12,'LineWidth',5)
plot(x',R_21,'LineWidth',5)
plot(x,R_22,'LineWidth',5)
yline(1,'-','Color','k');
yline(0,'-','Color','k');
xline(midrow)


legend('R11','R12','R21','R22')
xlabel('training steps')
ylabel('Order parameter')
% cost function
subplot(3,1,3); 
hPlot1 = plot(x',costarray,'LineWidth',5)


legend(strcat('training error converged =',num2str(costarray(end))));
xlabel('training steps')
ylabel('training error')
xline(midrow)


%  saveas(figure(1),[pwd '/learning_rates' num2str(alpha) 'Run1' '.png']);
hold off