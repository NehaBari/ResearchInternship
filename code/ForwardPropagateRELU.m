function [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,N)
student_scalar = zeros(K,1);
gxstudent = 0; 
x = 0;
si = 0;
for j=1:K
   % size(teacher_weights)
   % size(X)
   % something is wrong with student scalar
    student_scalar(j) = (dot(student_weights(j,:), X))/sqrt(N);
    x = student_scalar(j);
    
    if x > 0
       gxstudent = x;
       
    else
       gxstudent = 0;
    end 
    si = si + gxstudent; % tou is the final teacher output.

end
% need to store a vecir since teacher is a vector.
si1 = (si)/sqrt(K); % since the teachers are already orthonormal this should not matter.
student_scalar1 = student_scalar;

end
