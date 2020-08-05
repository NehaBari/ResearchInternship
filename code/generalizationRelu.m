function [generalization_error] = generalizationRelu(student_weights,teacher_weights,k,N)
student_weights = student_weights;
teacher_weights = teacher_weights;
k=k;
m = k;
sum1 = 0;
sum2 = 0;
sum3 = 0; % a bit confused if the sum1 ... sum3 should be or not initialized to zero.

% all the summations here are happening over same value of M = K = 2. 
for i = 1:k
    for j = 1:m
        
        
      

        Qii = dot(student_weights(i,:),student_weights(i,:));
        
        Qjj = dot(student_weights(j,:),student_weights(j,:));
        Qij = dot(student_weights(i,:),student_weights(j,:));
        Rij = dot(student_weights(i,:),teacher_weights(j,:));
        Tij = dot(teacher_weights(i,:),teacher_weights(j,:));
        Tmm = dot(teacher_weights(i,:),teacher_weights(i,:)); % tmm is over number of hidden units over 
        Tii = dot(teacher_weights(i,:),teacher_weights(i,:)); % Tmm and Tii are same, but still written different to avoid confusion.
        Tjj = dot(teacher_weights(j,:),teacher_weights(j,:)); % here j loops over M generally which is the number of hidden units in the teacher network
        
        %sum1 = sum1 + ( (Qij/4) + ((sqrt((Qii*Qjj) - (Qij^2))) + (Qij * asin(Qij/sqrt(Qii * Qjj))))/(2*pi));
        sum1 = sum1 + ((Qij/4) + ((sqrt((Qii * Qjj) - (Qij^2)) + (Qij * asin(Qij/sqrt(Qii * Qjj)))))/ (2*pi));
        sum2 = sum2 + ((Rij/4) + ((sqrt((Qii * Tjj) - (Rij^2)) + (Rij * asin(Rij/sqrt(Qii * Tmm)))))/ (2*pi));
        sum3 = sum3 + ((Tij/4) + ((sqrt((Tii * Tjj) - (Tij^2)) + (Tij * asin (Tij/sqrt(Tii * Tjj)))))/(2*pi));
    end
end

term1 =  (sum1/(2*k));
term2 =  (sum2/k);
term3 = (sum3/(2*k));

generalization_error = (term1  - term2 + term3);
end

% in future if the no of hidden units for teacher and student changes then
% you simply have to construct different for loops for calculating the sums
% for GE and in order parameter as well just have to do it in different
% loops






 
