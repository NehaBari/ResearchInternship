
function [] = RELUMALAY(alpha,gen_error,trainSteps,R,iteration,costarray,K,N)

    x = 1:size(gen_error,1);

    x1 = [];
    for i = 1:trainSteps
      if (rem(i,300)==0)
          x1 = [x1;i];
      end
    end
%    plot 1
    h = figure(iteration);
    

    % Generalization error
    
    subplot(3,1,1);
    
    plot(x',gen_error,'LineWidth',5)
    xlabel('t')
    ylabel('\fontsize{15} \epsilon\fontsize{8}_{g}')
   
    lg = legend(strcat('\fontsize{15} \epsilon\fontsize{8}_{g}=',num2str(gen_error(end))));
    lg.FontSize = 8;
%    
%     % Graph 1
%     % order parameter
%     subplot(3,1,2);
%     hold on
%     plot(x',R(:,1),'LineWidth',5,'Color',[0,0,1.0000])
%     plot(x',R(:,2),'LineWidth',5,'Color',[1.0000,0,0])
%     plot(x',R(:,3),'LineWidth',5,'Color',[0,1.0000,0])
%     plot(x',R(:,4),'LineWidth',5,'Color',[0,0, 0.1724])
%     
%     % order parameter K=2
%     plot(x',R(:,5),'LineWidth',5,'Color',[0.5172    ,0.4483         ,0])
%     plot(x,R(:,6),'LineWidth',5,'Color',[1.0000    ,0.7586    ,0.5172])
%     plot(x',R(:,7),'LineWidth',5,'Color',[0.6207    ,0.7586    ,1.0000])
%     plot(x,R(:,8),'LineWidth',5,'Color',[0.5517    ,0.6552    ,0.4828])
%     
%     %order parameter K=3
%     
%     plot(x',R(:,9),'LineWidth',5,'Color',[1.0000    ,0.1034    ,0.7241])
%     plot(x,R(:,10),'LineWidth',5,'Color',[1.0000,0.8276 ,0])
%     plot(x',R(:,11),'LineWidth',5,'Color',[0.8276    ,0.0690    ,1.0000])
%     plot(x,R(:,12),'LineWidth',5,'Color',[0.9655    ,0.0690    ,0.3793])
%     
%     
%     % order parameter K=4
%     
%     plot(x',R(:,13),'LineWidth',5,'Color',[0.5172,0.5172,1.0000])
%     plot(x,R(:,14),'LineWidth',5,'Color',[0.6207,0.3103,0.2759])
%     plot(x',R(:,15),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
%     plot(x,R(:,16),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
%     
%     yline(1,'-','Color','k');
%     yline(0,'-','Color','k');
%    % hSub = subplot(3,1,2); plot(1, nan, 1, nan, 'r'); set(hSub, 'Visible', 'off');
%     legend('R\_11','R\_12','R\_13','R\_14','R\_21','R\_22','R\_23','R\_24','R\_31','R\_32','R\_33','R\_34','R\_41','R\_42','R\_43','R\_44');
% %     set(lgd,'Location','Best');
%     xlabel('t')
%     ylabel('R\_{ij}')
%     hold off
%     
    


%   Graph 2

    subplot(3,1,2);
    hold on
    plot(x',R(:,1),'LineWidth',5,'Color',[0,0,0])
    plot(x',R(:,2),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,3),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,4),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,5),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,6),'LineWidth',5,'Color',[0,0,0])
    plot(x',R(:,7),'LineWidth',5,'Color',[1.0000,0,0])
    
    % K=2
    plot(x,R(:,8),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,9),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,10),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,11),'LineWidth',5,'Color',[0,0,0])
    plot(x,R(:,12),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,13),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,14),'LineWidth',5,'Color',[1.0000,0,0])
    
    % K=3
    plot(x',R(:,15),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,16),'LineWidth',5,'Color',[0,0,0])
    plot(x',R(:,17),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,18),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,19),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,20),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,21),'LineWidth',5,'Color',[0,0,0])
        
        
    %K=4
    plot(x',R(:,22),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,23),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,24),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x,R(:,25),'LineWidth',5,'Color',[1.0000,0,0])
    plot(x',R(:,26),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,27),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,28),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    
    
    %K=5
    
    plot(x',R(:,29),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,30),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,31),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,32),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,33),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,34),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,35),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    
    
    
    %K=6
    
    plot(x',R(:,36),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,37),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,38),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,39),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,40),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,41),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,42),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    
    
    
    %K=7
    
    plot(x',R(:,43),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,44),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,45),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,46),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,47),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    plot(x,R(:,48),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    plot(x',R(:,49),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
%     
    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
  %  legend('R\_11','R\_12','R\_13','R\_14','R\_21','R\_22','R\_23','R\_24','R\_31','R\_32','R\_33','R\_34','R\_41','R\_42','R\_43','R\_44');
%     set(lgd,'Location','Best');
    xlabel('t')
    ylabel('R\_{ij}')
    hold off
    
% error function Graph 3
    subplot(3,1,3);
    plot(x1',costarray,'LineWidth',5,'color',[0 0.6 0.3])
    xlabel('t')
    ylabel('\fontsize{12}E')
    legend(strcat('\fontsize{10}E=',num2str(costarray(end))))
    sgtitle(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
    
    %, num2str(alpha),' ','K=', num2str(K))
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Alpha0.5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Alpha0.5figs';
%     
%    filename = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Alpha1jpegs';
%    filename1 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Alpha1figs';


      
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Alpha1.25jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Alpha1.25figs';
    

%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Alpha1.75jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Alpha1.75figs';
      

      
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Alpha1.5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Alpha1.5figs';
    
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Alpha2jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Alpha2figs';
     
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Alpha2.5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Alpha2.5figs';

%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Alpha2.75jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Alpha2.75figs';
      
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Alpha3jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Alpha3figs';

%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Alpha3.25jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Alpha3.25figs';
     
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Alpha3.5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Alpha3.5figs';
 
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Alpha3.75jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Alpha3.75figs';
     
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Alpha4jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Alpha4figs';
     
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Alpha4.5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Alpha4.5figs';
     
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Alpha5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Alpha5figs';
 
%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Alpha5.5jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Alpha5.5figs';

  filename = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Alpha6jpegs';
  filename1 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Alpha6figs';

%   filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Alpha7jpegs';
%   filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Alpha7figs';    
    
    saveas(h,fullfile(filename,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    saveas(h,fullfile(filename1,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    close(h)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Graph 2
    p = figure(iteration);
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Train_Gen_combinedjpegs';
    
%        filename3 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Train_Gen_combinedfigs';
%        filename4 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Train_Gen_combinedjpegs';
    %
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Train_Gen_combinedjpegs';
    
    
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Train_Gen_combinedjpegs';
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Train_Gen_combinedjpegs';
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Train_Gen_combinedjpegs';
    %
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Train_Gen_combinedjpegs';
    
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Train_Gen_combinedjpegs';
    
    %
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Train_Gen_combinedjpegs';
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Train_Gen_combinedjpegs';
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Train_Gen_combinedjpegs';
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Train_Gen_combinedjpegs';
    
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Train_Gen_combinedjpegs';

    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Train_Gen_combinedjpegs';

    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Train_Gen_combinedjpegs';

    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Train_Gen_combinedjpegs';
    
    
      filename3 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Train_Gen_combinedfigs';
      filename4 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Train_Gen_combinedjpegs';
    %   filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Train_Gen_combinedfigs';
    %   filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Train_Gen_combinedjpegs';
    
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
    
%     
%      % Graph 3
%     h = figure(iteration);
% %     filename5 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Orderparameterfigs';
% %     filename6 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Orderparameterjpegs';
% 
%     filename5 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Orderparameterfigs';
%     filename6 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Orderparameterjpegs';
%       
%     plot(x',R(:,1),'LineWidth',5,'Color',[0,0,1.0000])
%     hold on
%     plot(x',R(:,2),'LineWidth',5,'Color',[1.0000,0,0])
%     hold on
%     plot(x',R(:,3),'LineWidth',5,'Color',[0,1.0000,0])
%     hold on
%     plot(x',R(:,4),'LineWidth',5,'Color',[0,0, 0.1724])
%     hold on
%     
%     % order parameter K=2
%     plot(x',R(:,5),'LineWidth',5,'Color',[0.5172    ,0.4483         ,0])
%     hold on
%     plot(x,R(:,6),'LineWidth',5,'Color',[1.0000    ,0.7586    ,0.5172])
%     hold on
%     plot(x',R(:,7),'LineWidth',5,'Color',[0.6207    ,0.7586    ,1.0000])
%     hold on
%     plot(x,R(:,8),'LineWidth',5,'Color',[0.5517    ,0.6552    ,0.4828])
%     hold on
%     
%     %order parameter K=3
%     
%     plot(x',R(:,9),'LineWidth',5,'Color',[1.0000    ,0.1034    ,0.7241])
%     hold on
%     plot(x,R(:,10),'LineWidth',5,'Color',[1.0000,0.8276 ,0])
%     hold on
%     plot(x',R(:,11),'LineWidth',5,'Color',[0.8276    ,0.0690    ,1.0000])
%     hold on
%     plot(x,R(:,12),'LineWidth',5,'Color',[0.9655    ,0.0690    ,0.3793])
%     hold on
%     
%     
%     % order parameter K=4
%     
%     plot(x',R(:,13),'LineWidth',5,'Color',[0.5172,0.5172,1.0000])
%     hold on
%     plot(x,R(:,14),'LineWidth',5,'Color',[0.6207,0.3103,0.2759])
%     hold on
%     plot(x',R(:,15),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
%     hold on
%     plot(x,R(:,16),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
%     hold on
%     
%     yline(1,'-','Color','k');
%     yline(0,'-','Color','k');
%     title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
%     legend('R\_11','R\_12','R\_13','R\_14','R\_21','R\_22','R\_23','R\_24','R\_31','R\_32','R\_33','R\_34','R\_41','R\_42','R\_43','R\_44');
% %     set(lgd,'Location','Best');
%     xlabel('t')
%     ylabel('R\_{ij}')
%     
%     saveas(h,fullfile(filename5,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
%     saveas(h,fullfile(filename6,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
%     hold off
%     close(h);
     










% Only order parameter graph

     h = figure(iteration);

%     filename5 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Orderparameterfigs';
%     filename6 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha1/Orderparameterjpegs';

    filename5 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Orderparameterfigs';
    filename6 = '/home/nehabari/Videos/antispecialization/RELU/K4Latest/Alpha6/Orderparameterjpegs';
      
    plot(x',R(:,1),'LineWidth',5,'Color',[0,0,0])
    hold on 
    plot(x',R(:,2),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,3),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,4),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,5),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,6),'LineWidth',5,'Color',[0,0,0])
    hold on 
    plot(x',R(:,7),'LineWidth',5,'Color',[0 1 0])
    hold on 
    
    % K=2
    plot(x,R(:,8),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,9),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,10),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,11),'LineWidth',5,'Color',[0,0,0])
    hold on 
    plot(x,R(:,12),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,13),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,14),'LineWidth',5,'Color',[0 1 0])
    hold on 
    
    % K=3
    plot(x',R(:,15),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,16),'LineWidth',5,'Color',[0,0,0])
    hold on 
    plot(x',R(:,17),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,18),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,19),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,20),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,21),'LineWidth',5,'Color',[0,0,0])
    hold on 
        
        
    %K=4
    plot(x',R(:,22),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,23),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,24),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x,R(:,25),'LineWidth',5,'Color',[0 1 0])
    hold on 
    plot(x',R(:,26),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,27),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,28),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    
    
    %K=5
    
    plot(x',R(:,29),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,30),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,31),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,32),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,33),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,34),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,35),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    
    
    
    %K=6
    
    plot(x',R(:,36),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,37),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,38),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,39),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,40),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,41),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,42),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    
    
    
    %K=7
    
    plot(x',R(:,43),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,44),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,45),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,46),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,47),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    hold on 
    plot(x,R(:,48),'LineWidth',5,'Color',[0.9655,0.6207,0.8621])
    hold on 
    plot(x',R(:,49),'LineWidth',5,'Color',[0.5862,0.8276,0.3103])
    
    
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
    title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
%    legend('R\_11','R\_12','R\_13','R\_14','R\_21','R\_22','R\_23','R\_24','R\_31','R\_32','R\_33','R\_34','R\_41','R\_42','R\_43','R\_44');
%     set(lgd,'Location','Best');
    xlabel('t')
    ylabel('R\_{ij}')
    
    saveas(h,fullfile(filename5,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    saveas(h,fullfile(filename6,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    hold off
    close(h);
    
end

