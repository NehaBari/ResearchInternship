function [train_error] = training_error(N,K,teacher_weights,student_weights,dataset)
[~,examples] = size(dataset);
train_error = 0;
tou = 0;
psi = 0;
for i=1:examples
      X = dataset(:,i);
    for j=1:K

        teacher_scalar(j) = (dot(teacher_weights(j,:), X))/sqrt(N);
        student_scalar(j) = (dot(student_weights(j,:), X))/sqrt(N);
        xstar = teacher_scalar(j);
        x = student_scalar(j);
        gxteacher = relu(xstar);
        gxstudent = relu(x);
        %THIS IS RELU

        tou = tou + gxteacher; % tou is the final teacher output.
        psi = psi + gxstudent; % tou is the final teacher output.

    end
    % need to store a vecir since teacher is a vector.
    tou = (tou)/sqrt(K); % since the teachers are already orthonormal this should not matter.
    psi = (psi)/sqrt(K);
    
    train_error = train_error + (tou-psi).^2;
end
    train_error = train_error / (2*examples);
end