
    x = 1:size(gen_error,1);
    figure(1)


    % Generalization error
    subplot(3,1,1);
   
    plot(x',gen_error,'LineWidth',5)
    xlabel('training steps')
    ylabel('GE')
   
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
   
    legend(strcat('gen\_error=',num2str(gen_error(end))))
   
   
    % order parameter
    subplot(3,1,2);
    hold on
    plot(x',R_11,'LineWidth',5)
    plot(x',R_12,'LineWidth',5)
    plot(x',R_13,'LineWidth',5)
    plot(x',R_21,'LineWidth',5)
    plot(x,R_22,'LineWidth',5)
    plot(x',R_23,'LineWidth',5)
    plot(x',R_31,'LineWidth',5)
    plot(x,R_32,'LineWidth',5)
    plot(x',R_33,'LineWidth',5)
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
   
    legend('R11','R12','R13','R21','R22','R23','R31','R32','R33');
    xlabel('training steps')
    ylabel('Order parameter')
    % cost function
%     subplot(3,1,3);
%     hPlot1 = plot(x',sMatrix,'LineWidth',5)
%     xlabel('training step')
%     ylabel('sMatrix')
    subplot(3,1,3);
    hPlot1 = plot(x',costarray,'LineWidth',5)
    xlabel('training step')
    ylabel('Traning Error')
    legend(strcat('training\_error=',num2str(costarray(end))))
   
%     legend(strcat('training error converged =',num2str(costarray(end))));
%     xlabel('training steps')
%     ylabel('training error')
%    
   
 
  %  saveas(figure(1),[pwd '/learning_rates' num2str(alpha) 'Run1' '.png']);
%     hold off
% %     
    figure(2)
    xlabel('Training steps')
    ylabel('S')
    plot(x',sMatrix,'LineWidth',5)