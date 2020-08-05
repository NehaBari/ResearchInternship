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

        teacher_scalar(j) = (dot(teacher_weights(j,:), X));
        student_scalar(j) = (dot(student_weights(j,:), X));
        xstar = teacher_scalar(j);
        x = student_scalar(j);
        gxteacher = relu(xstar);
        gxstudent = relu(x);
        %THIS IS RELU

        tou = (tou + gxteacher); % tou is the final teacher output.
        psi = (psi + gxstudent); % tou is the final teacher output.

    end    
    tou = tou/sqrt(K);
    psi = psi/sqrt(K);
    train_error = train_error + (tou-psi).^2;
end
    train_error = train_error / (2*examples);
end