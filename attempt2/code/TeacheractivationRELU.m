function [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N)

teacher_scalar = zeros(K,1); 
gx= 0;
xstar = 0;
tou = 0;

for j=1:K
    % local potential scaled
    teacher_scalar(j) = sqrt(N)*(dot(teacher_weights(j,:), X));
    xstar = teacher_scalar(j);
    
    gx = relu(xstar);
    tou = tou + gx;

end

tou1 = (tou)/sqrt(K);
teacher_scalar1 = teacher_scalar;
end

