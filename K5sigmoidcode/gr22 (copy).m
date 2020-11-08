%%
alphaArray2 = [1,1.25,1.5,1.75,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
%%
for alphas = 1:size(alphaArray2,2)
    %alphas = 1:size(alphaArray,2)
        
       
    for iteration= 1:10
        iteration
        alpha = alphaArray2(alphas);

        filename = '/home/nehabari/Documents/Finalcode/K5Sigmoid/K5sigmoidspecilaised';
        filename1 = fullfile(filename,['Alpha',num2str(alpha)]);
        filename2 = fullfile(filename1,['matfiles']);
        filename3 = fullfile(['Alpha_',num2str(alpha),'_',num2str(iteration),'.mat']);
        filename4 = fullfile(filename2,filename3);
        load(filename4);

          a = R_22(3400);
%         b = R_11(3400);
%         c = R_12(3400);
%         d = R_13(3400);
%         e = R_14(3400);
%         f = R_15(3400);
%         g = R_21(3400);
%         h = R_23(3400);
%         i = R_24(3400);
%         j = R_25(3400);
%         k = R_31(3400);
%         l = R_32(3400);
%         m = R_33(3400);
%         n = R_34(3400);
%         o = R_35(3400);
%         p = R_41(3400);
%         q = R_42(3400);
%         r = R_43(3400);
%         s = R_44(3400);
%         t = R_45(3400);
%         u = R_51(3400);
%         v = R_52(3400);
%         w = R_53(3400);
%         x = R_54(3400);
%         y = R_55(3400);
% 
      % clearvars -except alphaArray alphas  iteration a% b c d e f g h i j k l m n o p q r s t u v w x y iteration;
       clearvars -except a alphaArray2 alphas iteration;
        load('RPlotpleatue.mat');
          R_22_plot_pleatue(iteration,alphas) = a;
%         R_11_plot_pleatue(iteration,alphas) = b;
%         R_12_plot_pleatue(iteration,alphas) = c;
%         R_13_plot_pleatue(iteration,alphas) = d;
%         R_14_plot_pleatue(iteration,alphas) = e;
%         R_15_plot_pleatue(iteration,alphas) = f;
%         R_21_plot_pleatue(iteration,alphas) = g;
%         R_23_plot_pleatue(iteration,alphas) = h;
%         R_24_plot_pleatue(iteration,alphas) = i;
%         R_25_plot_pleatue(iteration,alphas) = j;
%         R_31_plot_pleatue(iteration,alphas) = k;
%         R_32_plot_pleatue(iteration,alphas) = l;
%         R_33_plot_pleatue(iteration,alphas) = m;
%         R_34_plot_pleatue(iteration,alphas) = n;
%         R_35_plot_pleatue(iteration,alphas) = o;
%         R_41_plot_pleatue(iteration,alphas) = p;
%         R_42_plot_pleatue(iteration,alphas) = q;
%         R_43_plot_pleatue(iteration,alphas) = r;
%         R_44_plot_pleatue(iteration,alphas) = s;
%         R_45_plot_pleatue(iteration,alphas) = t;
%         R_51_plot_pleatue(iteration,alphas) = u;
%         R_52_plot_pleatue(iteration,alphas) = v;
%         R_53_plot_pleatue(iteration,alphas) = w;
%         R_54_plot_pleatue(iteration,alphas) = x;
%         R_55_plot_pleatue(iteration,alphas) = y;
        save('RPlotpleatue.mat','R_11_plot_pleatue','R_12_plot_pleatue','R_13_plot_pleatue','R_14_plot_pleatue','R_15_plot_pleatue','R_21_plot_pleatue','R_22_plot_pleatue','R_23_plot_pleatue','R_24_plot_pleatue','R_25_plot_pleatue','R_31_plot_pleatue','R_32_plot_pleatue','R_33_plot_pleatue','R_34_plot_pleatue','R_35_plot_pleatue','R_41_plot_pleatue','R_42_plot_pleatue','R_43_plot_pleatue','R_44_plot_pleatue','R_45_plot_pleatue','R_51_plot_pleatue','R_52_plot_pleatue','R_53_plot_pleatue','R_54_plot_pleatue','R_55_plot_pleatue');

        clearvars -except alphaArray2 alphas;
    end
   
        clearvars -except alphaArray2 alphas;
 end


