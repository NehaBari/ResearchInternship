function [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N)

teacher_scalar = zeros(K,1); % is this unnecessary
gx= 0;
xstar = 0;
tou = 0;

for j=1:K

    teacher_scalar(j) = (dot(teacher_weights(j,:), X))/sqrt(N);
    xstar = teacher_scalar(j);
    
    if xstar>0
       gx = xstar;
    else
       gx = 0;
    end 
    tou = tou + gx; % tou is the final teacher output.

end
% need to store a vecir since teacher is a vector.
tou1 = (tou)/sqrt(K); % since the teachers are already orthonormal this should not matter.
teacher_scalar1 = teacher_scalar;
end

