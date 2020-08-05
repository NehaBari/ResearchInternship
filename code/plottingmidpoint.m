%[midrowpleatue,midrowconverged] = getMidpointsBigAlphas(gen_error);
%[midrowpleatueSmallAlphas,midrowconvergedSmallAlphas] = getMidpointssmallAlphas(gen_error);
[midrowpleatueSmallAlphas6,midrowconvergedSmallAlphas6] = getMidpointssmallAlphas6789(gen_error);

x = 1:size(gen_error,1);

% plotting generalization error vs alpha for Bigger Alphas midpoints
% figure(1)
% plot(x,gen_error)
% 
% xlabel('subsampled training steps')
% ylabel('subsampled Gen\_error')
% legend('gen\_error_converged=',num2str(gen_error(end)));
% title('gen error midpoint pleatue')




midrowconvergedSmallAlphas6

% midpoints 
figure(2)

subplot(3,1,1);

plot(x',gen_error,'LineWidth',5)
xlabel('training steps')
ylabel('GE')

yline(1,'-','Color','k');
yline(0,'-','Color','k');
xline(midrowpleatueSmallAlphas6)
xline(midrowconvergedSmallAlphas6)
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
xline(midrowpleatueSmallAlphas6)
xline(midrowconvergedSmallAlphas6)


legend('R11','R12','R21','R22')
xlabel('training steps')
ylabel('Order parameter')
% cost function
subplot(3,1,3); 
hPlot1 = plot(x',costarray,'LineWidth',5)


legend(strcat('training error converged =',num2str(costarray(end))));
xlabel('training steps')
ylabel('training error')
xline(midrowpleatueSmallAlphas6)
xline(midrowconvergedSmallAlphas6)


%  saveas(figure(1),[pwd '/learning_rates' num2str(alpha) 'Run1' '.png']);
hold off



