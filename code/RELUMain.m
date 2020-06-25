clear all;
clc;
learning_rate_array = linspace(3,7,20);

%alpha_array = 90*ones(1,20);
for h  = 1:size(learning_rate_array,2)

    K=2;% No. of hidden units in the hidden layer
    N=100; %Number of features in the dataset or no. of nodes/neurons in the input layer 
    alpha = 90;
    P= alpha* K*N; % number of examples in the dataset
    dataset = randn(N,P);
    gen_error = [];
    trainSteps = P*10; % 2000 * 10

    % order parameter
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

     strInitType = 'without overlap';

     [student_weights, teacher_weights] = studentTeacherInit(K,N,strInitType);
      if (strcmp(strInitType,'with overlap'))
          student_weights = student_weights';
          teacher_weights = teacher_weights';
          disp('in overlap')
      end 



        for n = 1:trainSteps% not p
             if (~trained)
                 i = randi(P);

                 X = dataset(:,i); % taking one example at a time?

                % FORWARD PROPAGATE
                 [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N);
                 [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,N);

                % CATCHING GE AND PLOTTING FOR EVERY EXAMPLE

                 [R,Q,gen_error1,student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,X,si1,tou1,P,n,learning_rate_array(h));
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
                 %determine whether the nn is trained or not
                 % minimum 100 training steps required
                 if(window_stopping<n)
                     maximum = max(gen_error(end-window_stopping:end));
                     minimum = min(gen_error(end-window_stopping:end));
                     delta = abs(maximum-minimum);
                     delta<=threshold_stopping;
                     if(delta<=threshold_stopping)
                         trained = 1;
                     end
                 end
             else 

                 break;

             end
        end

    x = 1:size(gen_error,1);
    figure(h)


    % Generalization error
    subplot(2,1,1);
    plot(x,gen_error,'o')
    xlabel('training steps')
    ylabel('GE')
    legend(strcat('gen_error=',num2str(gen_error(end))))
    % order parameter
    subplot(2,1,2); 
    hold on
    plot(x',R_11,'LineWidth',5)
    plot(x',R_12,'LineWidth',5)
    plot(x',R_21,'LineWidth',5)
    plot(x,R_22,'LineWidth',5)
    
    legend('R11','R12','R21','R22')
    xlabel('training steps')
    hold off
  
   % saveas(figure(h),[pwd '/learning_rates' num2str(learning_rate) '.png']);
  %  saveas(figure(h),[pwd '/alpha_mb' num2str(learning_rate_array(h)) '.png']);
   % close(figure(h))
   
end