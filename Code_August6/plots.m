
function [] = plots(alpha,gen_error,trainSteps,R,iteration,costarray,K,N)

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
   
    %yline(1,'-','Color','k');
    %yline(0,'-','Color','k');
    
   % str = ['\alpha=', num2str(alpha),' ','K=', num2str(K)];

   % dim = [0.80121527991982 0.892024081550746 0.098437497857958 0.02144469475504];
    %dim = [0.72 0.41 0.3 0.45];
%     dim = [.73 .39 0.35 0.44];
%     annotation('textbox',dim,'String',str,'FitBoxToText','on','FontSize',8);

    
   
    lg = legend(strcat('\fontsize{15} \epsilon\fontsize{8}_{g}=',num2str(gen_error(end))));
    lg.FontSize = 8;
   
    % Graph 1
    % order parameter
    subplot(3,1,2);
    hold on
    plot(x',R(:,1),'LineWidth',5)
    plot(x',R(:,2),'LineWidth',5)

    plot(x',R(:,3),'LineWidth',5)
    plot(x,R(:,4),'LineWidth',5)
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
   % hSub = subplot(3,1,2); plot(1, nan, 1, nan, 'r'); set(hSub, 'Visible', 'off');
    legend('R\_11','R\_12','R\_21','R\_22');
%     set(lgd,'Location','Best');
    xlabel('t')
    ylabel('R\_{ij}')
    hold off
    
    
    subplot(3,1,3);
    plot(x1',costarray,'LineWidth',5,'color',[0 0.6 0.3])
    xlabel('t')
    ylabel('\fontsize{12}E')
    legend(strcat('\fontsize{10}E=',num2str(costarray(end))))
    sgtitle(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])%, num2str(alpha),' ','K=', num2str(K))
%     filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Alpha0.5jpegs';
%     filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Alpha0.5figs';
%     
%     filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1/Alpha1jpegs';
% %     filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1/Alpha1figs';


      
%       filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Alpha1.25jpegs';
%       filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Alpha1.25figs';
    

%       filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Alpha1.75jpegs';
%       filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Alpha1.75figs';
      

      
%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Alpha1.5jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Alpha1.5figs';
    
%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Alpha2jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Alpha2figs';
%     
%     filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Alpha2.5jpegs';
%     filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Alpha2.5figs';

%       filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Alpha2.75jpegs';
%       filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Alpha2.75figs';
      
%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Alpha3jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Alpha3figs';

%       filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Alpha3.25jpegs';
%       filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Alpha3.25figs';
%     
      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Alpha3.5jpegs';
      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Alpha3.5figs';
% 
%        filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Alpha3.75jpegs';
%        filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Alpha3.75figs';
%     
%    filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Alpha4jpegs';
%    filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Alpha4figs';
%     
%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Alpha4.5jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Alpha4.5figs';
%     
%     filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Alpha5jpegs';
%     filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Alpha5figs';
% 
%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Alpha5.5jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Alpha5.5figs';

%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha6/Alpha6jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha6/Alpha6figs';
%      filename = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Alpha7jpegs';
%      filename1 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Alpha7figs';    
    saveas(h,fullfile(filename,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    saveas(h,fullfile(filename1,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    close(h)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Graph 2
    p = figure(iteration);
%     filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Train_Gen_combinedfigs';
%     filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha10/Train_Gen_combinedjpegs';
   
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1/Train_Gen_combinedjpegs';
% 
%       filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.5/Train_Gen_combinedjpegs';



%        filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Train_Gen_combinedfigs';
%        filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.25/Train_Gen_combinedjpegs';

%        filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Train_Gen_combinedfigs';
%        filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha1.75/Train_Gen_combinedjpegs';
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2/Train_Gen_combinedjpegs';
%     
%     filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Train_Gen_combinedfigs';
%     filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.5/Train_Gen_combinedjpegs';


%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha2.75/Train_Gen_combinedjpegs';

%     
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3/Train_Gen_combinedjpegs';

%       filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Train_Gen_combinedfigs';
%       filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.25/Train_Gen_combinedjpegs';
     
      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Train_Gen_combinedfigs';
      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.5/Train_Gen_combinedjpegs';

%        filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Train_Gen_combinedfigs';
%        filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha3.75/Train_Gen_combinedjpegs';
%     
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4/Train_Gen_combinedjpegs';
% %     
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha4.5/Train_Gen_combinedjpegs';
%     
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5/Train_Gen_combinedjpegs';
% 
%       filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Train_Gen_combinedfigs';
%       filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha5.5/Train_Gen_combinedjpegs';


%     filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha6/Train_Gen_combinedfigs';
%     filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha6/Train_Gen_combinedjpegs';
%      filename3 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Train_Gen_combinedfigs';
%      filename4 = '/home/nehabari/Videos/latest/July17Email/Code/Alpha7/Train_Gen_combinedjpegs';
    
    plot(x',gen_error,'-','MarkerEdgeColor',	[0,0,0],'MarkerFaceColor',[1 0 1],'LineWidth',5);
  % scatter(x',gen_error,'--','MarkerEdgeColor',	[0,0,0],'MarkerFaceColor',[1 0 1],'LineWidth',1.5);
%     xlabel('Training steps')
%     ylabel('Error')
    
    % adding annotations
    %str = ['\alpha=', num2str(alpha),' ', 'K=', num2str(K)];
    title(['\alpha=' , num2str(alpha),' ','K=', num2str(K)])
%     dim = [.73 .39 0.4 0.37]
%     annotation('textbox',dim,'String',str,'FitBoxToText','on');
 
    hold on

    %plot(x1',costarray,'LineWidth',5,'Color',[0.3010, 0.7450, 0.9330]);
    combined_graph  =  scatter(x1',costarray,'MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5);
    legend('\fontsize{18} \epsilon\fontsize{12}_{g}','\fontsize{12} E',num2str('alpha = %f', alpha)); 
    xlabel('t')
    ylabel('Error')
    
    

    saveas(combined_graph,fullfile(filename3,['Alpha_' num2str(alpha),'_',num2str(iteration) '.fig']));
    saveas(combined_graph,fullfile(filename4,['Alpha_' num2str(alpha),'_',num2str(iteration) '.jpeg']));
    hold off
    close(p);
    
end

