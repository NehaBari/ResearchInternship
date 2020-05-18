function [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,tou,N);
student_scalar = [];
gxstudent = 0; 
x = 0;
si = 0;

%NOT SURE IF THIS 0 INITIALIZATION IS CORRECT

for j=1:K
   % size(teacher_weights)
   % size(X)
    student_scalar = (dot(student_weights(j,:), X))/sqrt(N);
    x = student_scalar;
    
    if x <=0
       gxstudent = 0;
    else
       gxstudent = x;
    end 
    si = si + gxstudent; % tou is the final teacher output.

end
% need to store a vecir since teacher is a vector.
si1 = (si)/sqrt(K); % since the teachers are already orthonormal this should not matter.
student_scalar1 = student_scalar;

end
