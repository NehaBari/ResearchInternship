function [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,N)
student_scalar = zeros(K,1);
gxstudent = 0; 
x = 0;
si = 0;
for j=1:K
    % Local potential scaled
    student_scalar(j) = sqrt(N)*(dot(student_weights(j,:), X));
    x = student_scalar(j);
    
    gxstudent = relu(x);
    si = si + gxstudent; 

end

si1 = (si)/sqrt(K);
student_scalar1 = student_scalar;

end