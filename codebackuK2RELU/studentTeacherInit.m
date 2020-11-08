function [student_weights, teacher_weights] = studentTeacherInit(R,K,N,strInitType)

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
    T = eye(M);        %teacher-teacher overlaps
    Q = eye(K);    %Student-student "
    %R = [10^-3, 0; 0, 10^-3]; %Student-teacher "
    
    
    %R = [10^-3, 0,0,0,0,0,0,0,0,0; 0, 10^-3,0,0,0,0,0,0,0,0; 0, 0,10^-3,0,0,0,0,0,0,0; 0,0,0,0,10^-3,0,0,0,0,0; ]; %Student-teacher "
    
    [teacher_weights, student_weights] = layer_weight_init(Q, R, T, K, M, N);

    
else
        
disp("did not recognize init type")

end
    

end

