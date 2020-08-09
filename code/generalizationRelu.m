function [generalization_error] = generalizationRelu(student_weights,teacher_weights,k)

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
        Tmm = dot(teacher_weights(i,:),teacher_weights(i,:)); 
        Tii = dot(teacher_weights(i,:),teacher_weights(i,:)); 
        Tjj = dot(teacher_weights(j,:),teacher_weights(j,:)); 
        
        sum1 = sum1 + ((Qij/4) + ((sqrt((Qii * Qjj) - (Qij^2)) + (Qij * asin(Qij/sqrt(Qii * Qjj)))))/ (2*pi));
        sum2 = sum2 + ((Rij/4) + ((sqrt((Qii * Tjj) - (Rij^2)) + (Rij * asin(Rij/sqrt(Qii * Tmm)))))/ (2*pi));
        sum3 = sum3 + ((Tij/4) + ((sqrt((Tii * Tjj) - (Tij^2)) + (Tij * asin (Tij/sqrt(Tii * Tjj)))))/(2*pi));
    end
end

term1 =  sum1/(2*k);
term2 =  sum2/k;
term3 = sum3/(2*k);

generalization_error = term1  - term2 + term3;
end





 
