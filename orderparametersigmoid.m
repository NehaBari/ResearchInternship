function [R_in,Q_ik,gen_error1] = orderparametersigmoid(student_weights,teacher_weights,K,N,R_in,Q_ik,student_scalar,X,si,tou,P,gen_error)
mu = 3;

for i = 1:mu
 
     for j = 1:K
         %for m = 1:K
       % if mod(i,P) == 0
            i;
            R_in(i,j) = dot(student_weights(1,:), teacher_weights(j,:))/N;
           % R_in(i,end+1) = dot(student_weights(2,:), teacher_weights(j,:))/N;
          %  R_in(i,end+1) = dot(student_weights(2,:), teacher_weights(j,:))/N
            % weight vetor
            Q_ik(i,j) = dot(student_weights(1,:), student_weights(j,:))/N;
            %Q_ik(i) = dot(student_weights(1,:), student_weights(j,:))/N;
            % generalization error over the same example mu times to see
            % how much it has reduced.
            gen_error(i) = generalizationerror(student_weights,teacher_weights,K);
            gradient_epsilon_studentweights = (si - tou) * sqrt(2/pi)*exp(-(student_scalar*student_scalar)/2)* X;
            % updating the studen weight vector using gradient
            student_weights(j,:) =  (student_weights(j,:) - ((1.5/P)* gradient_epsilon_studentweights'))/N;
         %end
     end
end
    
% R_in = R_in;
% Q_ik = Q_ik;
gen_error1 = gen_error
%R_in(isnan(R_in)) = 1;
end

