
    x = 1:size(gen_error,1);
    % plot 1
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
    plot(x',R_11,'LineWidth',5,'Color',[0,0,1.0000])
    plot(x',R_12,'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R_13,'LineWidth',5,'Color',[0,1.0000,0])
    plot(x',R_14,'LineWidth',5,'Color',[0,0, 0.1724])
    
    plot(x',R_21,'LineWidth',5,'Color',[0.5172    ,0.4483         ,0])
    plot(x,R_22,'LineWidth',5,'Color',[1.0000    ,0.7586    ,0.5172])
    plot(x,R_23,'LineWidth',5,'Color',[0.6207    ,0.7586    ,1.0000])
    plot(x',R_24,'LineWidth',5,'Color',[0.5517    ,0.6552    ,0.4828])
    
    plot(x',R_31,'LineWidth',5,'Color',[1.0000    ,0.1034    ,0.7241])
    plot(x,R_32,'LineWidth',5,'Color',[1.0000,0.8276 ,0])
    plot(x,R_33,'LineWidth',5,'Color',[0.8276    ,0.0690    ,1.0000])
    plot(x',R_34,'LineWidth',5,'Color',[0.9655    ,0.0690    ,0.3793])
    
    plot(x',R_41,'LineWidth',5,'Color',[0.5172,0.5172,1.0000])
    plot(x,R_42,'LineWidth',5,'Color',[0.6207,0.3103,0.2759])
    plot(x,R_43,'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x',R_44,'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
   
    legend('R11','R12','R13','R14','R21','R22','R23','R24','R31','R32','R33','R34','R41','R42','R43','R44');
    xlabel('training steps')
    ylabel('Order parameter')

    subplot(3,1,3);
    plot(x',costarray,'LineWidth',5)
    xlabel('training step')
    ylabel('Traning Error')
    legend(strcat('training\_error=',num2str(costarray(end))))
   
    % plot 2
%     figure(2)
%     xlabel('Training steps')
%     ylabel('S')
%     plot(x',sMatrix,'LineWidth',5)
    
    % plot 3
    figure(3)
    plot(x',gen_error,'LineWidth',5,'Color',[0.75, 0, 0.75]);
    title('Combine Plots of gen\_error and Training error')

    hold on

    plot(x',costarray,'LineWidth',5,'Color',[0.3010, 0.7450, 0.9330]);
    legend('gen\_error','training\_error')
    hold off

