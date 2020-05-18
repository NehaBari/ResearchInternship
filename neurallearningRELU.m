

tou2 = [];
%si = 0;
%tou = 0;
K=4;% No. of hidden units in the hidden layer
N=10; %Number of features in the dataset or no. of nodes/neurons in the input layer 
P= 0.5 * K*N; % number of examples in the dataset
dataset = randn(N,P);
gen_error = [];
rngSeed = 999;
rng(rngSeed);
teacher_weights = randn(K,N)%./sqrt(N);
teacher_weights_ortho = GramSchmidt(teacher_weights'); % gramschimitz takes a column vector! do not forget.
teacher_weights = teacher_weights_ortho';

student_weights = randn(K,N);
student_weights = student_weights%./sqrt(N);
 
%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Storing:
% 1. Orderparameter
% 2. Generalization error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = 1:10000 % not p
        i = randi(P);
        X = dataset(:,i);  % taking one example at a time?
        % FORWARD PROPAGATE
         [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N);
         tou2 = [tou2;tou1];
         [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,tou1,N);
        % CATCHING GE AND PLOTTING FOR EVERY EXAMPLE
         [R_in,Q_ik,gen_error1] = orderparameterRELU(student_weights,teacher_weights,K,N,student_scalar1,X,si1,tou1,P,n);    
         gen_error = [gen_error;gen_error1];
      %  [gen_errorRELU] = generalizationRelu(student_weights,teacher_weights,K)
end

%gen_error

