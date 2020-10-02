%%
alphaArray5 = [0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,3.25,3.5,3.75,4,4.25,4.5,4.75,5,5.25,5.5,5.75,6,7,8,9,10,11,12,13,14,15,16,17];
%%
for alphas = 1:size(alphaArray5,2)
    %alphas = 1:size(alphaArray,2)
        
       
    for iteration= 1:30
        iteration
        alpha = alphaArray5(alphas);

        filename = '/home/nehabari/Documents/Finalcode/K2Sigmoid';
        filename1 = fullfile(filename,['Alpha',num2str(alpha)]);
        filename2 = fullfile(filename1,['matfiles']);
        filename3 = fullfile(['Alpha_',num2str(alpha),'_',num2str(iteration),'.mat']);
        filename4 = fullfile(filename2,filename3);
        load(filename4);

        a = gen_error(1000);
        b = R_11(1000);
        c = R_12(1000);
        d = R_21(1000);
        e = R_22(1000);
  
        clearvars -except alphaArray5 alphas a b c d e iteration;

        load('RPlotpleatue.mat');
        load('genErrsmallpleatuematrix');
        
        genErrsmallpleatuematrix(iteration,alphas) = a;
        R_11_plot_pleatue(iteration,alphas) = b;
        R_12_plot_pleatue(iteration,alphas) = c;
        R_21_plot_pleatue(iteration,alphas) = d;
        R_22_plot_pleatue(iteration,alphas) = e;
        save('genErrsmallpleatuematrix.mat','genErrsmallpleatuematrix');
        save('RPlotpleatue.mat','R_11_plot_pleatue','R_12_plot_pleatue','R_21_plot_pleatue','R_22_plot_pleatue');

        clearvars -except alphaArray5 alphas;
    end
   
        clearvars -except alphaArray5 alphas;
 end


