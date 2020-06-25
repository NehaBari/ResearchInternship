
% midpoint pleatue 
indices = [];
[indices,outofbound,movingavergearray] = movingaveragepleatue(gen_error,indices);
midrowpleatue = indices(ceil(end/2), :);

% midpoint converged state

indicescon = [];
[indicesconverged] = movingaverageconverged(gen_error,indicescon);
x = 1:size(gen_error,1);
plot(x,gen_error)
midrowconverged = indicesconverged(ceil(end/2), :);

save midpointsalpha.mat alpha midrowpleatue midrowconverged;


x = 1:size(gen_error,1);

% midpoint pleatue
figure(1)
plot(x,gen_error)

xlabel('subsampled training steps')
ylabel('subsampled Gen\_error')
legend('gen\_error_converged=',num2str(gen_error(end)));
title('gen error midpoint pleatue')






% midpoints 
figure(2)

subplot(3,1,1);

plot(x',gen_error,'LineWidth',5)
xlabel('training steps')
ylabel('GE')

yline(1,'-','Color','k');
yline(0,'-','Color','k');
xline(midrowpleatue)
xline(midrowconverged)
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
xline(midrowpleatue)
xline(midrowconverged)


legend('R11','R12','R21','R22')
xlabel('training steps')
ylabel('Order parameter')
% cost function
subplot(3,1,3); 
hPlot1 = plot(x',costarray,'LineWidth',5)


legend(strcat('training error converged =',num2str(costarray(end))));
xlabel('training steps')
ylabel('training error')
xline(midrowpleatue)
xline(midrowconverged)


%  saveas(figure(1),[pwd '/learning_rates' num2str(alpha) 'Run1' '.png']);
hold off



% figure(3)
% 
% xlabel('training steps')
% ylabel('Generalization error')
% title('midpoint converged')
% legend('gen\_error_converged=',num2str(gen_error(end)));
% 
% 
% 
% figure(4)
% % Generalization error
% subplot(3,1,1);
% 
% plot(x',gen_error,'LineWidth',5)
% xlabel('training steps')
% ylabel('GE')
% 
% yline(1,'-','Color','k');
% yline(0,'-','Color','k');
% xline(midrow)
% legend(strcat('gen\_error=',num2str(gen_error(end))))
% 
% 
% % order parameter
% subplot(3,1,2); 
% hold on
% plot(x',R_11,'LineWidth',5)
% plot(x',R_12,'LineWidth',5)
% plot(x',R_21,'LineWidth',5)
% plot(x,R_22,'LineWidth',5)
% yline(1,'-','Color','k');
% yline(0,'-','Color','k');
% xline(midrow)
% 
% 
% legend('R11','R12','R21','R22')
% xlabel('training steps')
% ylabel('Order parameter')
% % cost function
% subplot(3,1,3); 
% hPlot1 = plot(x',costarray,'LineWidth',5)
% 
% 
% legend(strcat('training error converged =',num2str(costarray(end))));
% xlabel('training steps')
% ylabel('training error')
% xline(midrow)
% 
% 
% %  saveas(figure(1),[pwd '/learning_rates' num2str(alpha) 'Run1' '.png']);
% hold off
% 