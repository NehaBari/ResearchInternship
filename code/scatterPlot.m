
alphaArray = linspace(5,29,25);
figure(10);
for i = 1:length(genErrsmallconvergematrix6to30(:,1))
plot(alphaArray,genErrsmallconvergematrix6to30(i,:),'o','Color','b')
xlabel('alphas')
ylabel('converged GE')
hold on
end
plot(alphaArray,mean(genErrsmallconvergematrix6to30,1),'*-','Color','k')
legend('converged GE for 10 runs')

hold off