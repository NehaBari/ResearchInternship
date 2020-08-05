clear all;
clc;
K=2;% No. of hidden units in the hidden layer
N=100; %Number of features in the dataset or no. of nodes/neurons in the input layer 
alpha = 1.5;
%alpha = 1alphaArray(alphas);
learning_rate = 6.5;
P= alpha* K*N; % number of examples in the dataset
dataset = randn(N,P);
gen_error = [];
%alpha 5
trainSteps = 2.5*10^5;
% stopping criteria
window_stopping = 100;
threshold_stopping = .001;
trained = 0;
% learning_rate = 6.7;
 R_11 = [];
 R_12 = [];
 R_21 = [];
 R_22 = [];
 Q_11 = [];
 
 Q_12 = [];
 Q_21 = [];
 Q_22 = []; 

 % teacher and student labels stored
 costarray = [];


 strInitType = 'with overlap';

 [student_weights, teacher_weights] = studentTeacherInit(K,N,strInitType);
  if (strcmp(strInitType,'with overlap'))
      student_weights = student_weights';
      teacher_weights = teacher_weights';
      disp('in overlap')
  end 



    for n = 1:trainSteps
         if (~trained)
             i = randi(P);

             X = dataset(:,i); % taking one example at a time?

            % FORWARD PROPAGATE: inference
            % teacher label (tou) calculated once per dataset
             [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N);
             [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,N);

             trainerror = training_error(N,K,teacher_weights,student_weights,dataset);
             costarray = [costarray;trainerror];


            % CATCHING GE AND PLOTTING FOR EVERY EXAMPLE

             [R,Q,gen_error1,student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,X,si1,tou1,P,n,learning_rate);

             %%%%%


             % [R,Q,gen_error1,student_weights_trained] = orderparameterRELU1(student_weights,teacher_weights,K,N,X,si1,tou1,P,n);

             R_11 = [R_11;R(1,1)];
             R_12 = [R_12;R(1,2)];
             R_21 = [R_21;R(2,1)];
             R_22 = [R_22;R(2,2)];
             Q_11 = [Q_11;Q(1,1)];
             Q_12 = [Q_12;Q(1,2)];
             Q_21 = [Q_21;Q(2,1)];
             Q_22 = [Q_22;Q(2,2)]; 
             student_weights = student_weights_trained;
             gen_error = [gen_error;gen_error1];
             % minimum 100 training steps required
             if(window_stopping<n)

                 maximumR11 = max(R_11(end-window_stopping:end));
                 maximumR12 = max(R_12(end-window_stopping:end));
                 maximumR21 = max(R_21(end-window_stopping:end));
                 maximumR22 = max(R_22(end-window_stopping:end));


                 minimumR11 = min(R_11(end-window_stopping:end));
                 minimumR12 = min(R_12(end-window_stopping:end));
                 minimumR21 = min(R_21(end-window_stopping:end));
                 minimumR22 = min(R_22(end-window_stopping:end));

                 deltaR11 = abs(maximumR11-minimumR11);
                 deltaR12 = abs(maximumR12 -minimumR12);
                 deltaR21 = abs(maximumR21-minimumR21);
                 deltaR22 = abs(maximumR22-minimumR22);

                 stop = (deltaR11<=threshold_stopping)&&(deltaR12<=threshold_stopping)&&(deltaR21<=threshold_stopping)&&(deltaR22<=threshold_stopping);


                 if(stop)
                     trained = 1;
                 end
             end
         else 

             break;

         end
    end

    x = 1:size(gen_error,1);
    figure(3)


    % Generalization error
    subplot(3,1,1);
   
    plot(x',gen_error,'LineWidth',5)
    xlabel('training steps')
    ylabel('GE')
   
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
   
    legend(strcat('gen\_error=',num2str(gen_error(end))))
   
   
    % order parameter
    subplot(3,1,2);
    hold on
    plot(x',R_11,'LineWidth',5)
    plot(x',R_12,'LineWidth',5)
    plot(x',R_21,'LineWidth',5)
    plot(x,R_22,'LineWidth',5)
    yline(1,'-','Color','k');
    yline(0,'-','Color','k');
   
    legend('R11','R12','R21','R22')
    xlabel('training steps')
    ylabel('Order parameter')
    % cost function
    subplot(3,1,3);
    plot(x',costarray,'LineWidth',5)

   
    legend(strcat('training error converged =',num2str(costarray(end))));
    xlabel('training steps')
    ylabel('training error')

