function [teacher_weights,student_weights] = studentTeacherInit(K,N,strInitType)

if (strcmp(strInitType,'without overlap'))
    
    teacher_weights = randn(K,N);
    teacher_weights_ortho = GramSchmidt(teacher_weights'); % gramschimit takes a column vector! do not forget.
    teacher_weights = teacher_weights_ortho';

    student_weights = randn(K,N);

    for jj = 1:K
    student_weights(jj,:) = student_weights(jj,:)/norm(student_weights(jj,:)); 
    end


elseif (strcmp(strInitType,'with overlap'))
    M = K;
    T = eye(K);        %teacher-teacher overlaps
   R= eye(K)*0.2;
   Q = eye(K);
%     Q = eye(K) +(0.04)*(ones(K)-eye(K));
% 
%     R=-0.001*eye(K) + (0.1)*(ones(K)-eye(K));

   

      

   
    
    [teacher_weights, student_weights] = layer_weight_init(Q, R, T, K, M, N);

    
else
        
disp("did not recognize init type")

end
    

end

