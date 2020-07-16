function [train_error] = training_error(N,K,teacher_weights,student_weights,dataset)

[~,examples] = size(dataset);
train_error = 0;

teacher_scalar = [];
student_scalar = [];

for i=1:examples
      X = dataset(:,i);
      tou = 0;
      psi = 0;
      
    for j=1:K
        % local potential scaled
        teacher_scalar(j) = sqrt(N)*(dot(teacher_weights(j,:), X));
        student_scalar(j) = sqrt(N)*(dot(student_weights(j,:), X));
        xstar = teacher_scalar(j);
        x = student_scalar(j);
        % Relu activation
        gxteacher = relu(xstar);
        gxstudent = relu(x);
        

        tou = (tou + gxteacher); % tou is the final Teacher output.
        psi = (psi + gxstudent); % Psi is the final Student output.

    end    
    tou = tou/sqrt(K);
    psi = psi/sqrt(K);
    train_error = train_error + (tou-psi).^2;
end
    train_error = train_error / (2*examples);
end