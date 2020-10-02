
function [] = plots(alpha,gen_error,trainSteps,R,iteration,costarray,K,N,filename)

    x = 1:size(gen_error,1);

%     x1 = [];
%     for i = 1:trainSteps
%       if (rem(i,300)==0)
%           x1 = [x1;i];
%       end
%     end
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
    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
%    legend('R\_11','R\_12','R\_13','R\_14','R\_15','R\_21','R\_22','R\_23','R\_24','R\_25','R\_31','R\_32','R\_33','R\_34','R\_35','R\_41','R\_42','R\_43','R\_44','R\_45','R\_51','R\_52','R\_53','R\_54','R\_55');
    legend('R\_11','R_12','R_21','R_22')
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
    
%      filename2 = fullfile(filename,['Alpha',num2str(alpha)],'Alphajpegs');
%      filename3 = fullfile(filename,['Alpha',num2str(alpha)],'Alphafigs');
%      saveas(h,fullfile(filename2,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
%      saveas(h,fullfile(filename3,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
     close(h)
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Training Error and Generalization Error
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    p = figure(iteration);
%     filename4 = fullfile(filename,['Alpha',num2str(alpha)],'Train_Gen_combinedfigs');
%     filename5 = fullfile(filename,['Alpha',num2str(alpha)],'Train_Gen_combinedjpegs');

     
    plot(x',gen_error,'-','MarkerEdgeColor',	[0,0,0],'MarkerFaceColor',[1 0 1],'LineWidth',5);
    title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
    hold on

    combined_graph  =  scatter(x1',costarray,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
    legend('\fontsize{18} \epsilon\fontsize{12}_{g}','\fontsize{12} E',num2str('alpha = %f', alpha)); 
    xlabel('t')
    ylabel('Error')
%     
%     saveas(combined_graph,fullfile(filename4,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
%     saveas(combined_graph,fullfile(filename5,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    hold off
    close(p);
    
   


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Single Order parameters graph
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     h = figure(iteration);

% 
%      filename6 = fullfile(filename,['Alpha',num2str(alpha)],'Orderparameterfigs');
%      filename7 = fullfile(filename,['Alpha',num2str(alpha)],'Orderparameterjpegs');
    
    plot(x',R(:,1),'LineWidth',5,'Color',[1.0000    ,     0,         0])
    hold on 
    plot(x',R(:,2),'LineWidth',5,'Color',[     0    ,1.0000,         0])
    hold on 
    plot(x',R(:,3),'LineWidth',5,'Color',[    0     ,    0  ,  0.1724])
    hold on 
    plot(x',R(:,4),'LineWidth',5,'Color',[1.0000    ,0.1034 ,   0.7241])
 
    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
    title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
    legend('R\_11','R_12','R_21','R_22');
    xlabel('t')
    ylabel('R\_{ij}')
%     
%     saveas(h,fullfile(filename6,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
%     saveas(h,fullfile(filename7,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    hold off
    close(h);
    
end

