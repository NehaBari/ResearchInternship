
alphaArray = [1,  1.25,  1.5,  1.75,  2,  2.25, 2.5, 2.75, 3, 3.25 ,3.5,3.75, 4];
figure(1);
for i = 1:length(Gen_error_con(:,1))
plot(alphaArray,Gen_error_con(i,:),'o','Color','b')
xlabel('alphas')
ylabel('converged GE')
hold on
end
plot(alphaArray,mean(Gen_error_con,1),'*-','Color','k')
legend('converged GE for 10 runs')

hold off
