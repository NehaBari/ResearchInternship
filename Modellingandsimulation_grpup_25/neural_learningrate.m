
 R_in = [];
% R_in2 = [];
 Q_ik = [];
 gen_error = [];

si = 0;
tou = 0;
P= 2; % number of examples in the dataset
K=2;% No. of hidden units in the hidden layer
N=10; %Number of features in the dataset or no. of nodes/neurons in the input layer 
dataset = randn(N,P);
Learningrates_array = [0.5,1,1.5,10];
lenLRArray=numel(Learningrates_array);
teacher_weights = randn(K,N)./sqrt(N);
teacher_weights_ortho = GramSchmidt(teacher_weights'); % gramschimitz takes a column vector! do not forget.
teacher_weights = teacher_weights_ortho';

student_weights = randn(K,N)./sqrt(N);
 
%%% gram smith problem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:P
    
        X = dataset(:,i);  % taking one example at a time?
        % FORWARD PROPAGATE
        [si,tou,student_scalar,teacher_scalar] = ForwardPropate(X,K,teacher_weights,student_weights,si,tou);
        % CATCHING GE AND PLOTTING FOR EVERY EXAMPLE
        [R_in,Q_ik] = orderparameter(student_weights,teacher_weights,K,N,R_in,Q_ik,student_scalar,X,si,tou);
        %%%student_s = student_scalar;
        % Calculating the gradient
      %%%  gradient_epsilon_studentweights = (si - tou) * sqrt(2/pi)*exp(-(student_s*student_s)/2)* dataset(:,i);
        % updating the studen weight vector using gradient
      %%%  student_weights(j,:) =  student_weights(j,:) - ((Learningrates_array(learning)/P)* gradient_epsilon_studentweights');
        
end

si = 0;
tou = 0;
