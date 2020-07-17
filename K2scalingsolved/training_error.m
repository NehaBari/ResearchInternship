function [train_error] = training_error(K,tou,student_weights,dataset)


examples = size(dataset,2);
[psi,~] = ForwardPropagate(dataset,K,student_weights);
    train_error = 0;
    train_error = (tou-psi).^2;
    train_error = (sum(train_error)) / (2*examples);
end