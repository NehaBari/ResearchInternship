function [R,Q,gen_error, student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,X,si1,tou1,P,n,learning_rate)
%R,Q is a matrix [R_11,R_12;R_21,R_22]

R = zeros(K,K);
Q = zeros(K,K);
gen_error = [];
student_weights_trained = zeros(size(student_weights));

if n==1
    for i = 1:K
        for m = 1:K
            R(i,m) = 0.2;
        end
    end


     for j = 1:K       
           % student scalar is not allocated right
            gen_error = generalizationRelu(student_weights,teacher_weights,K);
            gradient_studentweights = (si1 - tou1) * derivativeRELU(dot(student_weights(j,:),X))*X;
            student_weights_trained(j,:) =  (student_weights(j,:)) - ((3/N)* gradient_studentweights');
            student_weights_trained(j,:) = student_weights_trained(j,:)./norm(student_weights_trained(j,:));
            

     end
else




     for j = 1:K

            R(1,j) = dot(student_weights(1,:), teacher_weights(j,:));
            
            R(2,j) = dot(student_weights(2,:), teacher_weights(j,:));
            
            Q(1,j) = dot(student_weights(1,:), student_weights(j,:));
            
            Q(2,j) = dot(student_weights(2,:), student_weights(j,:));
       

            gen_error = generalizationRelu(student_weights,teacher_weights,K);
            gradient_studentweights = (si1 - tou1) * derivativeRELU(dot(student_weights(j,:),X))*X;
            student_weights_trained(j,:) =  (student_weights(j,:)) - ((learning_rate/N)* gradient_studentweights');
            student_weights_trained(j,:) = student_weights_trained(j,:)./norm(student_weights_trained(j,:));
            

     end
end
     gen_error1 = gen_error;



end

