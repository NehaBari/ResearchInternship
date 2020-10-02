alphaArray = [0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,3.25,3.5,3.75,4,4.25,4.5,4.75,5,5.25,5.5,5.75,6,7,8,9,10,11,12,13,14,15,16,17];

figure(1);
for i = 1:length(genErrsmallconvergedmatrix(:,1))
plot(alphaArray,genErrsmallconvergedmatrix(i,:),'o','Color','b')
xlabel('alphas')
ylabel('converged GE')
hold on
end
plot(alphaArray,mean(genErrsmallconvergedmatrix,1),'*-','Color','k')
legend('converged GE for 10 runs')

hold off
