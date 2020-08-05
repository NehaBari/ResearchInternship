clear all;
clc;


iterations = 1;
K=3;% No. of hidden units in the hidden layer
N=100; %Number of features in the dataset or no. of nodes/neurons in the input layer 
alpha = 10;
learning_rate = 5.5;
P= ceil(alpha* K*N); % number of examples in the dataset



    for iteration = 1: iterations
        trainSteps = 3.5*10^4;
        sMatrix = zeros(iterations,trainSteps);
        dataset = randn(N,P);
        gen_error = [];
        

        % stopping criteria
        window_stopping = 100;
        threshold_stopping = .001;
        trained = 0;
       % learning_rate = 6.7;
         R_11 = [];
         R_12 = [];
         R_13 = [];
         R_21 = [];
         R_22 = [];
         R_23 = [];
         R_31 = [];
         R_32 = [];
         R_33 = [];
         
         Q_11 = [];
         Q_12 = [];
         Q_13 = [];
         Q_21 = [];
         Q_22 = []; 
         Q_23 = [];
         Q_31 = [];
         Q_32 = [];
         Q_33 = [];
         
         sVector = [];
         % teacher and student labels stored
         costarray = [];


         strInitType = 'with overlap';
         
         %g)  Run additional experiments in which the student is anti-specialized initially  e.g. with R_{11}=R_{22}>0 
         %and R_{12}=R_{21} \approx 0
         
         %R = [0.2, 10^-4, 10^-4 ; 10^-4, 0.2, 10^-4; 10^-4, 10^-4, 0.2];
         
         
         %f)  Run additional experiments in which the student is anti-specialized initially  e.g. with R_{11}=R_{22}<0 
         %and R_{12}=R_{21} \approx 0
         %R= [-0.2, 10^-4, 10^-4 ; 10^-4, -0.2, 10^-4; 10^-4, 10^-4, -0.2];
        % R = [-0.04,10^-5,0 ; 10^-5, -0.04,0; 10^-5, 0, -0.04];
       % R = [0.02,0.02,0.02 ; 0.02, 0.02,0.02; 0.02, 0.02, 0.02];
        R = [8.995 * 10^-3, 0,0; 0, 8.995 * 10^-3,0;0, 0,8.995 * 10^-3];
         [student_weights, teacher_weights] = studentTeacherInit(R,K,N,strInitType);
         if (strcmp(strInitType,'with overlap'))
              % overlap code column vector
              student_weights = student_weights';
              teacher_weights = teacher_weights';
              disp('in overlap')
          end 



            for n = 1:trainSteps
                 if (1)
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
                     s = abs(R(1,1)-R(1,2)-R(1,3)) + abs(R(2,1)-R(2,2)-R(2,3)) + abs(R(3,3)-R(3,1)-R(3,2));
                    

                     % [R,Q,gen_error1,student_weights_trained] = orderparameterRELU1(student_weights,teacher_weights,K,N,X,si1,tou1,P,n);

                     R_11 = [R_11;R(1,1)];
                     R_12 = [R_12;R(1,2)];
                     R_13 = [R_13;R(1,3)];
                     R_21 = [R_21;R(2,1)];         
                     R_22 = [R_22;R(2,2)];
                     R_23 = [R_23;R(2,3)];
                     R_31 = [R_31;R(3,1)];
                     R_32 = [R_32;R(3,2)];
                     R_33 = [R_33;R(3,3)];
                     
                     Q_11 = [Q_11;Q(1,1)];
                     Q_12 = [Q_12;Q(1,2)];
                     Q_13 = [Q_13;Q(3,1)];
                     Q_21 = [Q_21;Q(2,1)];
                     Q_22 = [Q_22;Q(2,2)];
                     Q_23 = [Q_23;Q(2,3)];
                     Q_31 = [Q_31;Q(3,1)];
                     Q_32 = [Q_32;Q(3,2)];
                     Q_33 = [Q_33;Q(3,3)];
                     
                     sVector = [sVector;s];
                     student_weights = student_weights_trained;
                     gen_error = [gen_error;gen_error1];
                     % minimum 100 training steps required
                     if(window_stopping<n)

                         maximumR11 = max(R_11(end-window_stopping:end));
                         maximumR12 = max(R_12(end-window_stopping:end));
                         maximumR13 = max(R_13(end-window_stopping:end));
                         maximumR21 = max(R_21(end-window_stopping:end));
                         maximumR22 = max(R_22(end-window_stopping:end));
                         maximumR23 = max(R_23(end-window_stopping:end));
                         maximumR31 = max(R_31(end-window_stopping:end));
                         maximumR32 = max(R_32(end-window_stopping:end));
                         maximumR33 = max(R_33(end-window_stopping:end));


                         minimumR11 = min(R_11(end-window_stopping:end));
                         minimumR12 = min(R_12(end-window_stopping:end));
                         minimumR13 = min(R_13(end-window_stopping:end));
                         minimumR21 = min(R_21(end-window_stopping:end));
                         minimumR22 = min(R_22(end-window_stopping:end));
                         minimumR23 = min(R_23(end-window_stopping:end));
                         minimumR31 = min(R_31(end-window_stopping:end));
                         minimumR32 = min(R_32(end-window_stopping:end));
                         minimumR33 = min(R_33(end-window_stopping:end));

                         deltaR11 = abs(maximumR11-minimumR11);
                         deltaR12 = abs(maximumR12 -minimumR12);
                         deltaR13 = abs(maximumR13 -minimumR13);
                         deltaR21 = abs(maximumR21-minimumR21);
                         deltaR22 = abs(maximumR22-minimumR22);
                         deltaR23 = abs(maximumR23 -minimumR23);
                         deltaR31 = abs(maximumR31 -minimumR31);
                         deltaR32 = abs(maximumR32 -minimumR32);
                         deltaR33 = abs(maximumR33 -minimumR33);
                        

                         stop = (deltaR11<=threshold_stopping)&&(deltaR12<=threshold_stopping)&&(deltaR13<=threshold_stopping)&&(deltaR21<=threshold_stopping)&&(deltaR22<=threshold_stopping)&&(deltaR23<=threshold_stopping)&&(deltaR31<=threshold_stopping)&&(deltaR32<=threshold_stopping)&&(deltaR33<=threshold_stopping);


                         if(stop)
                             trained = 1;
                         end
                     end
                 else 

                     break;

                 end
            end
            sMatrix(iteration,:) = sVector;
            
            
    
    end

smean = mean(sMatrix);


