 %%
 alphaArray = [1,2,10,11,12,13,14,15,16,17,18,19,20];
 %%
% alphaArray1 = [1,1.25,1.5,1.75,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
figure(1);
errorbar(alphaArray,mean(genErrsmallconvergedmatrix,1),std(genErrsmallconvergedmatrix,1),'o-','Color','r','linewidth',2)
hold on
errorbar(alphaArray,mean(genErrsmallconvergedmatrixanti,1),std(genErrsmallconvergedmatrixanti,1),'o-','Color','g','linewidth',2)
hold on
errorbar(alphaArray,mean(genErrsmallpleatuematrix,1),std(genErrsmallpleatuematrix,1),'o-','Color','b','linewidth',2)
hold on
errorbar(alphaArray,mean(genErrsmallpleatuematrixAnti,1),std(genErrsmallpleatuematrixAnti,1),'o-','Color','k','linewidth',2)
hold on
ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);

ylim([-0.03 0.2])
set(gca,'ytick',[0,0.1,0.2,0.3,0.4])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}\epsilon_{g}')
legend('\fontsize{25}Specialized converged \fontsize{25}\epsilon_{g}','\fontsize{25}Antispecialized converged\fontsize{25}\epsilon_{g}','\fontsize{25}Specialized plateau \fontsize{25}\epsilon_{g}','\fontsize{25}Antispecialized plateau \fontsize{25}\epsilon_{g}','location','Best')

hold off




%%
 alphaArray = [1,1.25,1.5,1.75,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
% alphaArray1 = [1,1.25,1.5,1.75,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
figure(1);
errorbar(alphaArray,mean(genErrsmallconvergedmatrix,1),std(genErrsmallconvergedmatrix,1),'o-','Color','b','linewidth',2)
hold on
errorbar(alphaArray,mean(genErrsmallpleatuematrix,1),std(genErrsmallpleatuematrix,1),'o-','Color','r','linewidth',2)
hold on
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}\epsilon_{g}')
legend('\fontsize{25}Converged \fontsize{25}\epsilon_{g}','\fontsize{25}Plateau \fontsize{25}\epsilon_{g}','location','Best','linewidth',2)

hold off
%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R1 converged
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure(3);

for i = 1:length(R_11_plot_con(:,1))
% plot(alphaArray,R_11_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_11_plot_con,1),'o-','Color','k','linewidth',2)



hold on
for i = 1:length(R_12_plot_con(:,1))
% plot(alphaArray,R_12_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_12_plot_con,1),'o-','Color','r','linewidth',2)


hold on


for i = 1:length(R_13_plot_con(:,1))
% plot(alphaArray,R_13_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_13_plot_con,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_14_plot_con(:,1))
% plot(alphaArray,R_14_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_14_plot_con,1),'o-','Color','b','linewidth',2)

hold on
for i = 1:length(R_15_plot_con(:,1))
% plot(alphaArray,R_15_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_15_plot_con,1),'o-','Color','y','linewidth',2)
ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.5 0.5])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}converged R_{1j}')
legend('\fontsize{25}R_{11}', '\fontsize{25}R_{12}', '\fontsize{25}R_{13}', '\fontsize{25}R_{14}', '\fontsize{25}R_{15}','location','Best','linewidth',2);
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure(4)

for i = 1:length(R_21_plot_con(:,1))
%plot(alphaArray,R_21_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_21_plot_con,1),'o-','Color','r','linewidth',2)

hold on
for i = 1:length(R_22_plot_con(:,1))
%plot(alphaArray,R_22_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_22_plot_con,1),'o-','Color','k','linewidth',2)

hold on


for i = 1:length(R_23_plot_con(:,1))
%plot(alphaArray,R_23_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_23_plot_con,1),'o-','Color','g','linewidth',2)
hold on


for i = 1:length(R_24_plot_con(:,1))
%plot(alphaArray,R_24_plot_con(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_24_plot_con,1),'o-','Color','b','linewidth',2)



hold on
for i = 1:length(R_25_plot_con(:,1))
%plot(alphaArray,R_25_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_25_plot_con,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.5 0.5])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}converged R_{2j}')
legend('\fontsize{25}R_{21}', '\fontsize{25}R_{22}', '\fontsize{25}R_{23}', '\fontsize{25}R_{24}', '\fontsize{25}R_{25}','location','Best','linewidth',2);

hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure(5);
for i = 1:length(R_31_plot_con(:,1))
%plot(alphaArray,R_31_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_31_plot_con,1),'o-','Color','r','linewidth',2)



hold on
for i = 1:length(R_32_plot_con(:,1))
%plot(alphaArray,R_32_plot_con(i,:),'o','Color','g')

hold on
end
plot(alphaArray,mean(R_32_plot_con,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_33_plot_con(:,1))
%plot(alphaArray,R_33_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_33_plot_con,1),'o-','Color','k','linewidth',2)


hold on


for i = 1:length(R_34_plot_con(:,1))

%plot(alphaArray,R_34_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_34_plot_con,1),'o-','Color','b','linewidth',2)



hold on
for i = 1:length(R_35_plot_con(:,1))
%plot(alphaArray,R_35_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_35_plot_con,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.5 0.5])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}converged R_{3j}')
legend('\fontsize{25}R_{31}', '\fontsize{25}R_{32}', '\fontsize{25}R_{33}', '\fontsize{25}R_{34}', '\fontsize{25}R_{35}','location','Best','linewidth',2);

hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure(6)
for i = 1:length(R_41_plot_con(:,1))
%plot(alphaArray,R_41_plot_con(i,:),'o','Color','b')
xlabel('alphas')
ylabel('converged R_{4j}')
hold on
end
plot(alphaArray,mean(R_41_plot_con,1),'o-','Color','r','linewidth',2)
legend('converged R_{4j} for 10 runs')


hold on
for i = 1:length(R_42_plot_con(:,1))
% plot(alphaArray,R_42_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_42_plot_con,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_43_plot_con(:,1))
%plot(alphaArray,R_43_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_43_plot_con,1),'o-','Color','b','linewidth',2)


hold on


for i = 1:length(R_44_plot_con(:,1))
%plot(alphaArray,R_44_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_44_plot_con,1),'o-','Color','k','linewidth',2)



hold on
for i = 1:length(R_45_plot_con(:,1))
%plot(alphaArray,R_45_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_45_plot_con,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.5 0.5])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}converged R_{4j}')
legend('\fontsize{25}R_{41}', '\fontsize{25}R_{42}', '\fontsize{25}R_{43}', '\fontsize{25}R_{44}', '\fontsize{25}R_{45}','location','Best','linewidth',2);

hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%R3 converged
figure(7)
for i = 1:length(R_51_plot_con(:,1))
%plot(alphaArray,R_51_plot_con(i,:),'o','Color','r')

hold on
end
plot(alphaArray,mean(R_51_plot_con,1),'o-','Color','r','linewidth',2)


hold on
for i = 1:length(R_52_plot_con(:,1))
%plot(alphaArray,R_52_plot_con(i,:),'o','Color','g')

hold on
end
plot(alphaArray,mean(R_52_plot_con,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_53_plot_con(:,1))
%plot(alphaArray,R_53_plot_con(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_53_plot_con,1),'o-','Color','b','linewidth',2)


hold on


for i = 1:length(R_54_plot_con(:,1))
%plot(alphaArray,R_54_plot_con(i,:),'o','Color','y')

hold on
end
plot(alphaArray,mean(R_54_plot_con,1),'o-','Color','y','linewidth',2)



hold on
for i = 1:length(R_55_plot_con(:,1))
%plot(alphaArray,R_55_plot_con(i,:),'o','Color','k')

hold on
end
plot(alphaArray,mean(R_55_plot_con,1),'o-','Color','k','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.5 0.5])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}converged R_{5j}')
legend('\fontsize{25}R_{51}', '\fontsize{25}R_{52}', '\fontsize{25}R_{53}', '\fontsize{25}R_{54}', '\fontsize{25}R_{55}','location','Best');

hold off

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R1 pleatue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
figure(8);
for i = 1:length(R_11_plot_pleatue(:,1))
%plot(alphaArray,R_11_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_11_plot_pleatue,1),'o-','Color','k','linewidth',2)



hold on
for i = 1:length(R_12_plot_pleatue(:,1))
%plot(alphaArray,R_12_plot_pleatue(i,:),'o','Color','k')

hold on
end
plot(alphaArray,mean(R_12_plot_pleatue,1),'o-','Color','r','linewidth',2)


hold on


for i = 1:length(R_13_plot_pleatue(:,1))
%plot(alphaArray,R_13_plot_pleatue(i,:),'o','Color','k')

hold on
end
plot(alphaArray,mean(R_13_plot_pleatue,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_14_plot_pleatue(:,1))
%plot(alphaArray,R_14_plot_pleatue(i,:),'o','Color','k')

hold on
end
plot(alphaArray,mean(R_14_plot_pleatue,1),'o-','Color','b','linewidth',2)



hold on
for i = 1:length(R_15_plot_pleatue(:,1))
%plot(alphaArray,R_15_plot_pleatue(i,:),'o','Color','k')

hold on
end
plot(alphaArray,mean(R_15_plot_pleatue,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.1 0.6])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}plateau R_{1j}')
legend('\fontsize{25}R_{11}', '\fontsize{25}R_{12}', '\fontsize{25}R_{13}', '\fontsize{25}R_{14}', '\fontsize{25}R_{15}','location','Best');

hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% R2 pleatue
figure(9);
for i = 1:length(R_21_plot_pleatue(:,1))
%plot(alphaArray,R_21_plot_pleatue(i,:),'o','Color','b')
hold on
end
plot(alphaArray,mean(R_21_plot_pleatue,1),'o-','Color','r','linewidth',2)
legend('pleatue R_{2j} for 10 runs')


hold on
for i = 1:length(R_22_plot_pleatue(:,1))
%plot(alphaArray,R_22_plot_pleatue(i,:),'o','Color','b','linewidth',2)

hold on
end
plot(alphaArray,mean(R_22_plot_pleatue,1),'o-','Color','k','linewidth',2)


hold on


for i = 1:length(R_23_plot_pleatue(:,1))
%plot(alphaArray,R_23_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_23_plot_pleatue,1),'o-','Color','g','linewidth',2)

hold on


for i = 1:length(R_24_plot_pleatue(:,1))
%plot(alphaArray,R_24_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_24_plot_pleatue,1),'o-','Color','b','linewidth',2)



hold on
for i = 1:length(R_25_plot_pleatue(:,1))
%plot(alphaArray,R_25_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_25_plot_pleatue,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.1 0.6])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}plateau R_{2j}')
legend('\fontsize{25}R_{21}', '\fontsize{25}R_{22}', '\fontsize{25}R_{23}', '\fontsize{25}R_{24}', '\fontsize{25}R_{25}','location','Best');

hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% R3 pleatue
figure(10);
for i = 1:length(R_31_plot_pleatue(:,1))
%plot(alphaArray,R_31_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_31_plot_pleatue,1),'o-','Color','r','linewidth',2)
legend('pleatue R_{3j} for 10 runs')


hold on
for i = 1:length(R_32_plot_pleatue(:,1))
%plot(alphaArray,R_32_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_32_plot_pleatue,1),'o-','Color','g','linewidth',2)

hold on


for i = 1:length(R_33_plot_pleatue(:,1))
%plot(alphaArray,R_33_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_33_plot_pleatue,1),'o-','Color','k','linewidth',2)

hold on


for i = 1:length(R_34_plot_pleatue(:,1))
%plot(alphaArray,R_34_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_34_plot_pleatue,1),'o-','Color','b','linewidth',2)



hold on
for i = 1:length(R_35_plot_pleatue(:,1))
%plot(alphaArray,R_35_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_35_plot_pleatue,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.1 0.6])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}plateau R_{3j}')
legend('\fontsize{25}R_{31}', '\fontsize{25}R_{32}', '\fontsize{25}R_{33}', '\fontsize{25}R_{34}', '\fontsize{25}R_{35}','location','Best');


hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%R4 pleatue
figure(11);
for i = 1:length(R_41_plot_pleatue(:,1))
%plot(alphaArray,R_41_plot_pleatue(i,:),'o','Color','b')
end
plot(alphaArray,mean(R_41_plot_pleatue,1),'o-','Color','r','linewidth',2)
legend('pleatue R_{4j} for 10 runs')


hold on
for i = 1:length(R_42_plot_pleatue(:,1))
%plot(alphaArray,R_42_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_42_plot_pleatue,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_43_plot_pleatue(:,1))
%plot(alphaArray,R_43_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_43_plot_pleatue,1),'o-','Color','b','linewidth',2)


hold on


for i = 1:length(R_44_plot_pleatue(:,1))
%plot(alphaArray,R_44_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_44_plot_pleatue,1),'o-','Color','k','linewidth',2)



hold on
for i = 1:length(R_45_plot_pleatue(:,1))
%plot(alphaArray,R_45_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_45_plot_pleatue,1),'o-','Color','y','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.1 0.6])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}plateau R_{4j}')
legend('\fontsize{25}R_{41}', '\fontsize{25}R_{42}', '\fontsize{25}R_{43}', '\fontsize{25}R_{44}', '\fontsize{25}R_{45}','location','Best');

hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%R5 pleatue
%R4 pleatue
figure(12);
for i = 1:length(R_51_plot_pleatue(:,1))
%plot(alphaArray,R_51_plot_pleatue(i,:),'o','Color','b')
xlabel('alphas')
ylabel('pleatue R_{5j}')
hold on
end
plot(alphaArray,mean(R_51_plot_pleatue,1),'o-','Color','r','linewidth',2)
legend('pleatue R_{5j} for 10 runs')


hold on
for i = 1:length(R_52_plot_pleatue(:,1))
%plot(alphaArray,R_52_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_52_plot_pleatue,1),'o-','Color','g','linewidth',2)


hold on


for i = 1:length(R_53_plot_pleatue(:,1))
%plot(alphaArray,R_53_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_53_plot_pleatue,1),'o-','Color','b','linewidth',2)

hold on


for i = 1:length(R_54_plot_pleatue(:,1))
%plot(alphaArray,R_54_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_54_plot_pleatue,1),'o-','Color','y','linewidth',2)



hold on
for i = 1:length(R_55_plot_pleatue(:,1))
%plot(alphaArray,R_55_plot_pleatue(i,:),'o','Color','b')

hold on
end
plot(alphaArray,mean(R_55_plot_pleatue,1),'o-','Color','k','linewidth',2)

ax = gca;
ax.FontSize = 13; 
set(gca,'FontSize',20);
ylim([-0.1 0.6])
xlabel('\fontsize{32}\alpha')
ylabel('\fontsize{32}plateau R_{5j}')
legend('\fontsize{25}R_{51}', '\fontsize{25}R_{52}', '\fontsize{25}R_{53}', '\fontsize{25}R_{54}', '\fontsize{25}R_{55}','location','Best');

hold off

