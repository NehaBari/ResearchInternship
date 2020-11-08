function [R,Q,gen_error, student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,psi,tou,learning_rate,i,local_potential_student,X)
%R,Q is a matrix [R_11,R_12;R_21,R_22]
% This function calculates orderparameters and Gradient updates

R = zeros(K,K);
Q = zeros(K,K);
gen_error = [];
student_weights_trained = zeros(size(student_weights));
for j = 1:K
            % Gradient update
            
            %gradient_studentweights = (psi - tou(i,:)) * derivativeRELU(dot(student_weights(j,:),X))*X;
            gradient_studentweights = (psi - tou(i,:)) * derivativeRELU(local_potential_student(j,:))*X;
            student_weights_trained(j,:) =  (student_weights(j,:)) - ((learning_rate/N)* gradient_studentweights');
            student_weights_trained(j,:) = student_weights_trained(j,:)./norm(student_weights_trained(j,:));
            

end

R = student_weights_trained * teacher_weights';
Q = student_weights_trained * student_weights_trained';

gen_error = generalizationRelu(student_weights_trained,teacher_weights,K);

end

