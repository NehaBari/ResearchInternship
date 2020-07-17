function [final_output,local_potential] = ForwardPropagate(dataset,K,weights)
% column vector per example

local_potential = zeros(K,size(dataset,2)); % Local potential
no_examples = size(dataset,2);
% storing output for all examples in a vector
final_output = zeros(no_examples,1);
for i=1:no_examples
    
    % per example set x = 0, gx = 0 and activation_function_output = 0
    X = dataset(:,i);
    
    x = 0;
    % activation function summed output per example
    activation_function_output = 0;
    
    for j=1:K
        gx= 0;
        % local potential scaled
        local_potential(j,i) = (dot(weights(j,:), X));
        x = local_potential(j,i);

        gx = relu(x);
        % Summation of activation function output per hidden unit
        activation_function_output = activation_function_output + gx;

    end
    
    % Summation scaled by sqrt K
    % This summation is per example
    activation_function_output = (activation_function_output)/sqrt(K);
    final_output(i,:) =  activation_function_output;
end

end

