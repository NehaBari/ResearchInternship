
function [] = plots(alpha,gen_error,trainSteps,R,iteration,costarray,K,N)

    x = 1:size(gen_error,1);

    x1 = [];
    for i = 1:trainSteps
      if (rem(i,300)==0)
          x1 = [x1;i];
      end
    end
    % Graph 1
    h = figure(iteration);
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Sub Generalization error graph
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    subplot(3,1,1);
    
    plot(x',gen_error,'LineWidth',5)
    xlabel('t')
    ylabel('\fontsize{15} \epsilon\fontsize{8}_{g}')
   
    lg = legend(strcat('\fontsize{15} \epsilon\fontsize{8}_{g}=',num2str(gen_error(end))));
    lg.FontSize = 8;  


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Sub Order parameters graph
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    subplot(3,1,2);
    hold on
    plot(x',R(:,1),'LineWidth',5,'Color',[1.0000    ,     0,         0])
    plot(x',R(:,2),'LineWidth',5,'Color',[     0    ,1.0000,         0])
    plot(x',R(:,3),'LineWidth',5,'Color',[    0     ,    0  ,  0.1724])
    plot(x',R(:,4),'LineWidth',5,'Color',[1.0000    ,0.1034 ,   0.7241])
    plot(x',R(:,5),'LineWidth',5,'Color',[1.0000    ,0.8276 ,        0])
    plot(x,R(:,6),'LineWidth',5,'Color',[     0    ,0.3448 ,        0])
    plot(x',R(:,7),'LineWidth',5,'Color',[0.5172    ,0.5172 ,   1.0000])
    
    
    plot(x,R(:,8),'LineWidth',5,'Color',[0.6207    ,0.3103 ,   0.2759])
    plot(x',R(:,9),'LineWidth',5,'Color',[     0    ,1.0000 ,   0.7586])
    plot(x,R(:,10),'LineWidth',5,'Color', [     0    ,0.5172 ,   0.5862])
    plot(x',R(:,11),'LineWidth',5,'Color', [     0    ,     0 ,   0.4828])
    plot(x,R(:,12),'LineWidth',5,'Color',[0.5862    ,0.8276 ,  0.3103])
    plot(x',R(:,13),'LineWidth',5,'Color',[0.9655   , 0.6207 ,   0.8621])
    plot(x,R(:,14),'LineWidth',5,'Color',[0.8276   , 0.0690 ,   1.0000])
    
    
    plot(x',R(:,15),'LineWidth',5,'Color',[0.4828   , 0.1034 ,   0.4138])
    plot(x,R(:,16),'LineWidth',5,'Color',[1.0000   , 0.7586 ,   0.5172])
    plot(x',R(:,17),'LineWidth',5,'Color',[0.1379   , 0.1379 ,   0.0345])
    plot(x,R(:,18),'LineWidth',5,'Color', [0.5517   , 0.6552 ,   0.4828])
    plot(x',R(:,19),'LineWidth',5,'Color',[0.9655    ,0.5172 ,   0.0345])
    plot(x,R(:,20),'LineWidth',5,'Color',[0.5172  ,  0.4483 ,        0])
    plot(x',R(:,21),'LineWidth',5,'Color',[0.4483 ,   0.9655 ,   1.0000])
        
        
    
    plot(x',R(:,22),'LineWidth',5,'Color',[0.6207 ,   0.7586 ,   1.0000])
    plot(x,R(:,23),'LineWidth',5,'Color',[0.4483,    0.3793 ,   0.4828])
    plot(x',R(:,24),'LineWidth',5,'Color',[0.4483,    0.3793 ,   0.4828])
    plot(x,R(:,25),'LineWidth',5,'Color', [0    ,0.2759    ,0.5862])

    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
    legend('R\_11','R\_12','R\_13','R\_14','R\_15','R\_21','R\_22','R\_23','R\_24','R\_25','R\_31','R\_32','R\_33','R\_34','R\_35','R\_41','R\_42','R\_43','R\_44','R\_45','R\_51','R\_52','R\_53','R\_54','R\_55');
    xlabel('t')
    ylabel('R\_{ij}')
    hold off
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Sub Training Error graph
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(3,1,3);
    plot(x1',costarray,'LineWidth',5,'color',[0 0.6 0.3])
    xlabel('t')
    ylabel('\fontsize{12}E')
    legend(strcat('\fontsize{10}E=',num2str(costarray(end))))
    sgtitle(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
    

  filename = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/Alphajpegs';
  filename1 = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/Alphafigs';
    
    saveas(h,fullfile(filename,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    saveas(h,fullfile(filename1,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    close(h)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Training Error and Generalization Error
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    p = figure(iteration);
      filename3 = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/Train_Gen_combinedfigs';
      filename4 = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/Train_Gen_combinedjpegs';
     
    plot(x',gen_error,'-','MarkerEdgeColor',	[0,0,0],'MarkerFaceColor',[1 0 1],'LineWidth',5);
    title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
    hold on

    combined_graph  =  scatter(x1',costarray,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
    legend('\fontsize{18} \epsilon\fontsize{12}_{g}','\fontsize{12} E',num2str('alpha = %f', alpha)); 
    xlabel('t')
    ylabel('Error')
    
    saveas(combined_graph,fullfile(filename3,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    saveas(combined_graph,fullfile(filename4,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    hold off
    close(p);
    
   


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Single Order parameters graph
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     h = figure(iteration);


    filename5 = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/Orderparameterfigs';
    filename6 = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/Orderparameterjpegs';
      
    plot(x',R(:,1),'LineWidth',5,'Color',[1.0000    ,     0,         0])
    hold on 
    plot(x',R(:,2),'LineWidth',5,'Color',[     0    ,1.0000,         0])
    hold on 
    plot(x',R(:,3),'LineWidth',5,'Color',[    0     ,    0  ,  0.1724])
    hold on 
    plot(x',R(:,4),'LineWidth',5,'Color',[1.0000    ,0.1034 ,   0.7241])
    hold on 
    plot(x',R(:,5),'LineWidth',5,'Color',[1.0000    ,0.8276 ,        0])
    hold on 
    plot(x,R(:,6),'LineWidth',5,'Color',[     0    ,0.3448 ,        0])
    hold on 
    plot(x',R(:,7),'LineWidth',5,'Color',[0.5172    ,0.5172 ,   1.0000])
    hold on 
    
    
    plot(x,R(:,8),'LineWidth',5,'Color',[0.6207    ,0.3103 ,   0.2759])
    hold on 
    plot(x',R(:,9),'LineWidth',5,'Color',[     0    ,1.0000 ,   0.7586])
    hold on 
    plot(x,R(:,10),'LineWidth',5,'Color', [     0    ,0.5172 ,   0.5862])
    hold on 
    plot(x',R(:,11),'LineWidth',5,'Color', [     0    ,     0 ,   0.4828])
    hold on 
    plot(x,R(:,12),'LineWidth',5,'Color',[0.5862    ,0.8276 ,  0.3103])
    hold on 
    plot(x',R(:,13),'LineWidth',5,'Color',[0.9655   , 0.6207 ,   0.8621])
    hold on 
    plot(x,R(:,14),'LineWidth',5,'Color',[0.8276   , 0.0690 ,   1.0000])
    hold on 
    
   
    plot(x',R(:,15),'LineWidth',5,'Color',[0.4828   , 0.1034 ,   0.4138])
    hold on 
    plot(x,R(:,16),'LineWidth',5,'Color',[1.0000   , 0.7586 ,   0.5172])
    hold on 
    plot(x',R(:,17),'LineWidth',5,'Color',[0.1379   , 0.1379 ,   0.0345])
    hold on 
    plot(x,R(:,18),'LineWidth',5,'Color', [0.5517   , 0.6552 ,   0.4828])
    hold on 
    plot(x',R(:,19),'LineWidth',5,'Color',[0.9655    ,0.5172 ,   0.0345])
    hold on 
    plot(x,R(:,20),'LineWidth',5,'Color',[0.5172  ,  0.4483 ,        0])
    hold on 
    plot(x',R(:,21),'LineWidth',5,'Color',[0.4483 ,   0.9655 ,   1.0000])
    hold on 
        
        
   
    plot(x',R(:,22),'LineWidth',5,'Color',[0.6207 ,   0.7586 ,   1.0000])
    hold on 
    plot(x,R(:,23),'LineWidth',5,'Color',[0.4483,    0.3793 ,   0.4828])
    hold on 
    plot(x',R(:,24),'LineWidth',5,'Color',[0.4483,    0.3793 ,   0.4828])
    hold on 
    plot(x,R(:,25),'LineWidth',5,'Color', [0    ,0.2759    ,0.5862])
    
    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
    title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
    legend('R\_11','R\_12','R\_13','R\_14','R\_15','R\_21','R\_22','R\_23','R\_24','R\_25','R\_31','R\_32','R\_33','R\_34','R\_35','R\_41','R\_42','R\_43','R\_44','R\_45','R\_51','R\_52','R\_53','R\_54','R\_55');

    xlabel('t')
    ylabel('R\_{ij}')
    
    saveas(h,fullfile(filename5,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    saveas(h,fullfile(filename6,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    hold off
    close(h);
    
end

