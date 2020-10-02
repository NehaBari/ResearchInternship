function [generalization_error] = generalizationSigmoid(student_weights,teacher_weights,k)

k=k;
m = k;
sum1 = 0;
sum2 = 0;
sum3 = 0;

% all the summations here are happening over same value of M = K = 2. 
for i = 1:k
    for j = 1:m
        
        
      

        Qii = dot(student_weights(i,:),student_weights(i,:));
        
        Qjj = dot(student_weights(j,:),student_weights(j,:));
        Qij = dot(student_weights(i,:),student_weights(j,:));
        
        Rij = dot(student_weights(i,:),teacher_weights(j,:));
        
        Tij = dot(teacher_weights(i,:),teacher_weights(j,:));
        Tii = dot(teacher_weights(i,:),teacher_weights(i,:)); 
        Tjj = dot(teacher_weights(j,:),teacher_weights(j,:)); 
        
        sum1 = sum1 + asin((Qij) / (sqrt(1+Qii) * sqrt(1+Qjj) ) );
        sum2 = sum2 + asin((Tij) / (sqrt(1+Tii) * sqrt(1+Tjj) ) );
        sum3 = sum3 + asin((Rij) / (sqrt(1+Qii) * sqrt(1+Tjj) ) );
    end
end

term1 =  sum1;
term2 =  sum2;
term3 = 2*sum3;

generalization_error = (1/pi)*(term1  + term2 - term3);

end





 
