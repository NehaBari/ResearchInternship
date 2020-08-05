function [R,Q,gen_error, student_weights_trained] = orderparameterRELU1(student_weights,teacher_weights,K,N,X,si1,tou1,P,n)
%R,Q is a matrix [R_11,R_12;R_21,R_22]

R = zeros(K,K);
Q = zeros(K,K);
gen_error = [];
student_weights_trained = zeros(size(student_weights));



     for j = 1:K

            R(1,j) = dot(student_weights(1,:), teacher_weights(j,:));
            
            R(2,j) = dot(student_weights(2,:), teacher_weights(j,:));
            
            Q(1,j) = dot(student_weights(1,:), student_weights(j,:));
            
            Q(2,j) = dot(student_weights(2,:), student_weights(j,:));
       
           % student scalar is not allocated right
            gen_error = generalizationRelu(student_weights,teacher_weights,K);
          %  gen_error(j) = generalizationRelu(student_weights,teacher_weights,K);
            gradient_studentweights = (si1 - tou1) * derivativeRELU(dot(student_weights(j,:),X))*X;
            % updating the studen weight vector using gradient
            % Is dividing by P necessary?
            student_weights_trained(j,:) =  (student_weights(j,:)) - ((6.5/N)* gradient_studentweights');
            student_weights_trained(j,:) = student_weights_trained(j,:)./norm(student_weights_trained(j,:));
            

  
end
     gen_error1 = gen_error;



end


