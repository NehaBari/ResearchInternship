function [R,Q,gen_error, student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,X,si1,tou1,P,n,learning_rate)
%R,Q is a matrix [R_11,R_12;R_21,R_22]
% This function calculates orderparameters and Gradient updates

R = zeros(K,K);
Q = zeros(K,K);
gen_error = [];
student_weights_trained = zeros(size(student_weights));
for j = 1:K
            % order parameters

            R(1,j) = dot(student_weights(1,:), teacher_weights(j,:));
            
            R(2,j) = dot(student_weights(2,:), teacher_weights(j,:));
             
            R(3,j) = dot(student_weights(3,:), teacher_weights(j,:));

            
            Q(1,j) = dot(student_weights(1,:), student_weights(j,:));
            
            Q(2,j) = dot(student_weights(2,:), student_weights(j,:));
            
            Q(3,j) = dot(student_weights(3,:), student_weights(j,:));

            % Gradient update

            gen_error = generalizationRelu(student_weights,teacher_weights,K);
            gradient_studentweights = (si1 - tou1) * derivativeRELU(dot(student_weights(j,:),X),N)*X;
            student_weights_trained(j,:) =  (student_weights(j,:)) - ((learning_rate/N)* gradient_studentweights');
            student_weights_trained(j,:) = student_weights_trained(j,:)./norm(student_weights_trained(j,:));
            

end
    

        

end

