 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Converged graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alphaArray = [0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,3.25,3.5,3.75,4,4.25,4.5,4.75,5,5.25,5.5,5.75,6,7,8,9,10,11,12,13,14,15,16,17];


figure(1);
for i = 1:length(genErrsmallconvergedmatrix(:,1))
%plot(alphaArray,Gen_error_con(i,:),'o','Color','b')
xlabel('\fontsize{16}\alpha')
ylabel('converged \fontsize{16}\epsilon\fontsize{12}_{g}')
hold on
end
err = std(genErrsmallconvergedmatrix,1);

% errorbar(alphaArray,(mean(genErrsmallconvergedmatrix,1)),err,'-s','MarkerSize',3,...
%     'MarkerEdgeColor','red','MarkerFaceColor','red','Color','k','LineWidth',3)

errorbar(alphaArray,(mean(genErrsmallconvergedmatrix,1)),err,'o-','Color','k','LineWidth',3)
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
for i = 1:length(genErrsmallconvergedmatrix(:,1))
%plot(alphaArray,Gen_error_con(i,:),'o','Color','b')
xlabel('\fontsize{16}\alpha')
ylabel('converged \fontsize{16}\epsilon\fontsize{12}_{g}')
hold on
end
err = std(genErrsmallconvergedmatrix,1);

% errorbar(alphaArray,(mean(genErrsmallconvergedmatrix,1)),err,'-s','MarkerSize',3,...
%     'MarkerEdgeColor','red','MarkerFaceColor','red','Color','k','LineWidth',3)

errorbar(alphaArray,(mean(genErrsmallconvergedmatrix,1)),err,'o-','Color','k','LineWidth',3)
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (3);
%plot(alphaArray,mean(R_11_plot_con,1),'*-','Color','r')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_11_plot_con,1)),err,'o-','Color','r','LineWidth',3)
hold on

%plot(alphaArray,mean(R_12_plot_con,1),'*-','Color','g')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_12_plot_con,1)),err,'o-','Color','g','LineWidth',3)
hold on

%plot(alphaArray,mean(R_21_plot_con,1),'*-','Color','y')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_21_plot_con,1)),err,'o-','Color','m','LineWidth',3)
hold on

%plot(alphaArray,mean(R_22_plot_con,1),'*-','Color','b')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_22_plot_con,1)),err,'o-','Color','b','LineWidth',3)
xlabel('\fontsize{16}\alpha')
ylabel('Converged R{ij}')
legend('R{11}','R{12}','R{21}','R{22}');
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (4);
%plot(alphaArray,mean(R_11_plot_pleatue,1),'*-','Color','r')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_11_plot_con,1)),err,'o-','Color','r','LineWidth',3)
hold on

%plot(alphaArray,mean(R_12_plot_pleatue,1),'*-','Color','g')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_12_plot_pleatue,1)),err,'o-','Color','g','LineWidth',3)
hold on

%plot(alphaArray,mean(R_21_plot_pleatue,1),'*-','Color','y')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_21_plot_pleatue,1)),err,'o-','Color','m','LineWidth',3)
hold on

%plot(alphaArray,mean(R_22_plot_pleatue,1),'*-','Color','b')
err = std(R_11_plot_con,1);
errorbar(alphaArray,(mean(R_22_plot_pleatue,1)),err,'o-','Color','b','LineWidth',3)
xlabel('\fontsize{16}\alpha')
ylabel('Pleatue R_{ij}')
legend('R_{11}','R_{12}','R_{21}','R_{22}');
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pleatue graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)


for i = 1:length(genErrsmallpleatuematrix(:,1))
xlabel('\fontsize{16}\alpha')
ylabel('Pleatue \fontsize{16}\epsilon\fontsize{12}_{g}')
hold on
end
err = std(genErrsmallpleatuematrix,1);
errorbar(alphaArray,mean(genErrsmallpleatuematrix,1),err,'*-','Color','k','LineWidth',3)
hold off