%%
alphaArray = [0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,3.25,3.5,3.75,4,4.25,4.5,4.75,5,5.25,5.5,5.75,6,7,8,9,10,11,12,13,14,15,16,17];
figure(1);
errorbar(alphaArray,mean(genErrsmallconvergedmatrix,1),std(genErrsmallconvergedmatrix,1),'o-','Color','b')
hold on
errorbar(alphaArray,mean(genErrsmallpleatuematrix,1),std(genErrsmallpleatuematrix,1),'o-','Color','r')
hold on
xlabel('\fontsize{16}\alpha')
ylabel('\fontsize{16}\epsilon_{g}')
legend('\fontsize{13}converged \fontsize{15}\epsilon_{g}','\fontsize{13}pleateau \fontsize{15}\epsilon_{g}','location','Best')

hold off


%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R1 converged
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3);

for i = 1:length(R_11_plot_con(:,1))
% plot(alphaArray,R_11_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_11_plot_con,1),'*-','Color','k')



hold on
for i = 1:length(R_12_plot_con(:,1))
% plot(alphaArray,R_12_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_12_plot_con,1),'*-','Color','b')

xlabel('\alpha')
ylabel('converged R_{1j}')
legend('\fontsize{13}R_{11}','\fontsize{13}R_{12}','location','Best');
hold on
%%

figure(3);

for i = 1:length(R_21_plot_con(:,1))
% plot(alphaArray,R_11_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_21_plot_con,1),'*-','Color','b')



hold on
for i = 1:length(R_22_plot_con(:,1))
% plot(alphaArray,R_12_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_22_plot_con,1),'*-','Color','k')

xlabel('\alpha')
ylabel('converged R_{2j}')
legend('\fontsize{13}R_{21}','\fontsize{13}R_{22}','location','Best');
hold on

%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R1 pleateau
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3);

for i = 1:length(R_11_plot_pleatue(:,1))
% plot(alphaArray,R_11_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_11_plot_pleatue,1),'*-','Color','k')



hold on
for i = 1:length(R_12_plot_pleatue(:,1))
% plot(alphaArray,R_12_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_12_plot_pleatue,1),'*-','Color','b')

xlabel('\alpha')
ylabel('plateau R_{1j}')
legend('\fontsize{13}R_{11}','\fontsize{13}R_{12}','location','Best');
hold on
%%
figure(3);

for i = 1:length(R_21_plot_pleatue(:,1))
% plot(alphaArray,R_11_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_21_plot_pleatue,1),'*-','Color','b')



hold on
for i = 1:length(R_22_plot_pleatue(:,1))
% plot(alphaArray,R_12_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_22_plot_pleatue,1),'*-','Color','k')


xlabel('\alpha')
ylabel('plateau R_{2j}')
legend('\fontsize{13}R_{21}','\fontsize{13}R_{22}','location','Best');
hold on