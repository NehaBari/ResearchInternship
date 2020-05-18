function [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N)

teacher_scalar = []; % is this unnecessary
gx= 0;
xstar = 0;
tou = 0;

for j=1:K
   % size(teacher_weights)
   % size(X)
    teacher_scalar = (dot(teacher_weights(j,:), X))/sqrt(N);
    xstar = teacher_scalar;
    
    if xstar <=0
       gx = 0;
    else
       gx = xstar;
    end 
    tou = tou + gx; % tou is the final teacher output.

end
% need to store a vecir since teacher is a vector.
tou1 = (tou)/sqrt(K); % since the teachers are already orthonormal this should not matter.
teacher_scalar1 = teacher_scalar;
end

