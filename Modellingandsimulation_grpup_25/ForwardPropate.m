function [si1,tou1,student_scalar1,teacher_scalar1] = ForwardPropate(X,K,teacher_weights,student_weights,si,tou)

% si=si;
% tou=tou;

student_scalar = [];
teacher_scalar = [];
activation_teacher = 0;
activation_student = 0; %NOT SURE IF THIS 0 INITIALIZATION IS CORRECT
size(teacher_weights)
for j=1:K
   % size(teacher_weights)
   % size(X)
    teacher_scalar = dot(teacher_weights(j,:), X)
    student_scalar = dot(student_weights(j,:), X) ;

    activation_teacher  = 1+erf(teacher_scalar/sqrt(2));
    activation_student  = 1+erf(student_scalar/sqrt(2));

    % summation of all the dot products of student & teacher weight vectors
    % with input data.
    si = si + activation_student
    tou = tou + activation_teacher

end

si1 = si;
tou1 = tou;
student_scalar1 = student_scalar;
teacher_scalar1 = teacher_scalar;
end

