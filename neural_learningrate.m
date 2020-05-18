
 R_in = [];
% R_in2 = [];
 Q_ik = [];
 gen_error = [];

si = 0;
tou = 0;
P= 5; % number of examples in the dataset
K=2;% No. of hidden units in the hidden layer
N=10; %Number of features in the dataset or no. of nodes/neurons in the input layer 
dataset = randn(N,P);
Learningrates_array = [0.5,1,1.5,10];
lenLRArray=numel(Learningrates_array);
teacher_weights = randn(K,N)%./sqrt(N);
teacher_weights_ortho = GramSchmidt(teacher_weights'); % gramschimitz takes a column vector! do not forget.
teacher_weights = teacher_weights_ortho';

student_weights = randn(K,N)%./sqrt(N);
 
%%% gram smith problem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = 1:P
        i = randi(P);
        X = dataset(:,i);  % taking one example at a time?
        % FORWARD PROPAGATE
        [si,tou,student_scalar,teacher_scalar] = ForwardPropatesigmoid(X,K,teacher_weights,student_weights,si,tou);
        % CATCHING GE AND PLOTTING FOR EVERY EXAMPLE
        [R_in,Q_ik,gen_error] = orderparametersigmoid(student_weights,teacher_weights,K,N,R_in,Q_ik,student_scalar,X,si,tou,P,gen_error);    
        %gen_error
      %  [gen_errorRELU] = generalizationRelu(student_weights,teacher_weights,K)
end

gen_error;
%si = 0; % set to zero right here?
%tou = 0;
