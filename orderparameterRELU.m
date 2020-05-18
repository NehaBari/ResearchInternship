function [R_in,Q_ik,gen_error1] = orderparameterRELU(student_weights,teacher_weights,K,N,student_scalar1,X,si1,tou1,P,n)

R_in = []; % student teacher order parameter
Q_ik = []; % student student order parameter
gen_error = [];
%for i = 1:mu
 
     for j = 1:K
            R_in(n,j) = dot(student_weights(1,:), teacher_weights(j,:))/N;

            Q_ik(n,j) = dot(student_weights(1,:), student_weights(j,:))/N;

            gen_error = generalizationRelu(student_weights,teacher_weights,K);
            abs(si1 - tou1);
            o =sqrt(2/pi)*exp(-(student_scalar1*student_scalar1)/2);
            gradient_epsilon_studentweights = (si1 - tou1) * sqrt(2/pi)*exp(-(student_scalar1*student_scalar1)/2)* X;
            % updating the studen weight vector using gradient
            % Is dividing by P necessary?
            student_weights(j,:) =  (student_weights(j,:) - ((1.5/P)* gradient_epsilon_studentweights'))/norm(student_weights);

     end
     gen_error1 = gen_error;
%end


end

