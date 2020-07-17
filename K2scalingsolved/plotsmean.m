
    x = 1:size(gen_error,1);
    x1 = []
    for i = 1:trainSteps
      if (rem(i,100)==0)
          x1 = [x1;i];
      end
    end
    % plot 1
    figure(1)


    % Generalization error
    subplot(3,1,1);
   
    plot(x',gen_error,'LineWidth',5)
    xlabel('training steps')
    ylabel('GE')
   
    %yline(1,'-','Color','k');
    %yline(0,'-','Color','k');
   
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
   
    legend('R11','R12','R21','R22');
    xlabel('training steps')
    ylabel('Order parameter')

    subplot(3,1,3);
    plot(x1',costarray,'LineWidth',5)
    xlabel('training step')
    ylabel('Traning Error')
    legend(strcat('training\_error=',num2str(costarray(end))))
   
    % plot 2
    figure(2)
    xlabel('Training steps')
    ylabel('S')
    plot(x',sMatrix,'LineWidth',5)
    
    % plot 3
    figure(3)
    plot(x',gen_error,'LineWidth',5,'Color',[0.75, 0, 0.75]);
    title('Combine Plots of gen\_error and Training error')

    hold on

    %plot(x1',costarray,'LineWidth',5,'Color',[0.3010, 0.7450, 0.9330]);
    scatter(x1',costarray,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5)
    legend('gen\_error','training\_error')

    hold off

