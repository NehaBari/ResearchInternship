clear all;
clc;

    for iteration = 1: iterations
        
        iteration
        iterations = 15;
        
        load('genErrsmallconvergedmatrix.mat');
        load('genErrsmallpleatuematrix.mat');
        load('R_convergedmatrix.mat');
        
        
        % loading final mat files
        load('RPlotpleatue.mat');
        load('RPlotconverged.mat');
        
        
        K=4;% No. of hidden units in the hidden layer
        N=100; %Number of features in the dataset or no. of nodes/neurons in the input layer 
        alpha = 10;
        learning_rate = 5.5;
        P= ceil(alpha* K*N); % number of examples in the dataset

        trainSteps = P*15;
        
        
        sMatrix = zeros(iterations,trainSteps);
        dataset = randn(N,P);
        gen_error = [];
        
        % normalizing dataset
        for ii = 1:P
        dataset(:,ii) = dataset(:,ii)./norm(dataset(:,ii));
        end
        
        % stopping criteria
        window_stopping = 100;
        threshold_stopping = .001;
        trained = 0;
         R_11 = [];
         R_12 = [];
         R_13 = [];
         R_14 = [];
         R_21 = [];
         R_22 = [];
         R_23 = [];
         R_24 = [];
         R_31 = [];
         R_32 = [];
         R_33 = [];
         R_34 = [];
         
         R_41 = [];
         R_42 = [];
         R_43 = [];
         R_44 = [];

         
         Q_11 = [];
         Q_12 = [];
         Q_13 = [];
         Q_14 = [];
         Q_21 = [];
         Q_22 = []; 
         Q_23 = [];
         Q_24 = [];
         Q_31 = [];
         Q_32 = [];
         Q_33 = [];
         Q_34 = [];
         
         Q_41 = [];
         Q_42 = [];
         Q_43 = [];
         Q_44 = [];
         
         sVector = [];
         costarray = [];
        

         strInitType = 'with overlap';
         %R = [8.995 * 10^-3, 0,0; 0, 8.995 * 10^-3,0;0, 0,8.995 * 10^-3];
         R= [-0.2, 10^-4, 10^-4,10^-4; 10^-4, -0.2,10^-4, 10^-4; 10^-4, 10^-4, -0.2,10^-4 ;10^-4, 10^-4, 10^-4,-0.2]
         [student_weights, teacher_weights] = studentTeacherInit(R,K,N,strInitType);
         
         for kk = 1:size(student_weights,2)
            student_weights(:,kk) = student_weights(:,kk)/norm(student_weights(:,kk));
            teacher_weights(:,kk) = teacher_weights(:,kk)/norm(teacher_weights(:,kk));
         
         end
         
         if (strcmp(strInitType,'with overlap'))
              % overlap code column vector
              student_weights = student_weights';
              teacher_weights = teacher_weights';
              disp('in overlap')
          end 



            for n = 1:trainSteps
                 if (1)
                     i = randi(P);

                     X = dataset(:,i);
                     
                     % FORWARD PROPAGATE: inference
                     [tou1,teacher_scalar1] = TeacheractivationRELU(X,K,teacher_weights,N);
                     [si1,student_scalar1] = ForwardPropagateRELU(X,K,student_weights,N);
                     
                     trainerror = training_error(N,K,teacher_weights,student_weights,dataset);
                     costarray = [costarray;trainerror];


                     

                     [R,Q,gen_error1,student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,X,si1,tou1,P,n,learning_rate);
        
                     %
                  %   s = abs(R(1,1)-R(1,2)) + abs(R(2,1)-R(2,2));
                    
                     R_11 = [R_11;R(1,1)];
                     R_12 = [R_12;R(1,2)];
                     R_13 = [R_13;R(1,3)];
                     R_14 = [R_14;R(1,4)];
                     
                     
                     R_21 = [R_21;R(2,1)];
                     R_22 = [R_22;R(2,2)];
                     R_23 = [R_23;R(2,3)];
                     R_24 = [R_24;R(2,4)];
                     
                     
                     R_31 = [R_31;R(3,1)];
                     R_32 = [R_32;R(3,2)];
                     R_33 = [R_33;R(3,3)];
                     R_34 = [R_34;R(3,4)];
                     
                     
                     R_41 = [R_41;R(4,1)];
                     R_42 = [R_42;R(4,2)];
                     R_43 = [R_43;R(4,3)];
                     R_44 = [R_44;R(4,4)];
                     
                     Q_11 = [Q_11;Q(1,1)];
                     Q_12 = [Q_12;Q(1,2)];
                     Q_13 = [Q_13;Q(1,3)];
                     Q_14 = [Q_14;Q(1,4)];
                     
                     Q_21 = [Q_21;Q(2,1)];
                     Q_22 = [Q_22;Q(2,2)];
                     Q_23 = [Q_23;Q(2,3)];
                     Q_24 = [Q_23;Q(2,4)];
                     
                     Q_31 = [Q_31;Q(3,1)];
                     Q_32 = [Q_32;Q(3,2)];
                     Q_33 = [Q_33;Q(3,3)];
                     Q_34 = [Q_34;Q(3,4)];
                     
                     Q_41 = [Q_41;Q(4,1)];
                     Q_42 = [Q_42;Q(4,2)];
                     Q_43 = [Q_43;Q(4,3)];
                     Q_44 = [Q_44;Q(4,4)];

                     
      

                %     sVector = [sVector;s];
                     student_weights = student_weights_trained;
                     gen_error = [gen_error;gen_error1];
                     % minimum 100 training steps required
                     if(window_stopping<n)
                         maximumR11 = max(R_11(end-window_stopping:end));
                         maximumR12 = max(R_12(end-window_stopping:end));
                         maximumR13 = max(R_13(end-window_stopping:end));
                         maximumR14 = max(R_14(end-window_stopping:end));
                         
                         maximumR21 = max(R_21(end-window_stopping:end));
                         maximumR22 = max(R_22(end-window_stopping:end));
                         maximumR23 = max(R_23(end-window_stopping:end));
                         maximumR24 = max(R_24(end-window_stopping:end));
                         
                         maximumR31 = max(R_31(end-window_stopping:end));
                         maximumR32 = max(R_32(end-window_stopping:end));
                         maximumR33 = max(R_33(end-window_stopping:end));
                         maximumR34 = max(R_34(end-window_stopping:end));
                        
                         maximumR41 = max(R_41(end-window_stopping:end));
                         maximumR42 = max(R_42(end-window_stopping:end));
                         maximumR43 = max(R_43(end-window_stopping:end));
                         maximumR44 = max(R_44(end-window_stopping:end));


                         minimumR11 = min(R_11(end-window_stopping:end));
                         minimumR12 = min(R_12(end-window_stopping:end));
                         minimumR13 = min(R_13(end-window_stopping:end));
                         minimumR14 = min(R_14(end-window_stopping:end));
                         
                         
                         
                         minimumR21 = min(R_21(end-window_stopping:end));
                         minimumR22 = min(R_22(end-window_stopping:end));
                         minimumR23 = min(R_23(end-window_stopping:end));
                         minimumR24 = min(R_24(end-window_stopping:end));
                         
                         minimumR31 = min(R_31(end-window_stopping:end));
                         minimumR32 = min(R_32(end-window_stopping:end));
                         minimumR33 = min(R_33(end-window_stopping:end));
                         minimumR34 = min(R_34(end-window_stopping:end));
                         
                         
                         minimumR41 = min(R_41(end-window_stopping:end));
                         minimumR42 = min(R_42(end-window_stopping:end));
                         minimumR43 = min(R_43(end-window_stopping:end));
                         minimumR44 = min(R_44(end-window_stopping:end));

                         deltaR11 = abs(maximumR11-minimumR11);
                         deltaR12 = abs(maximumR12 -minimumR12);
                         deltaR13 = abs(maximumR13 -minimumR13);
                         deltaR14 = abs(maximumR14 -minimumR14);
                         
                         deltaR21 = abs(maximumR21-minimumR21);
                         deltaR22 = abs(maximumR22-minimumR22);
                         deltaR23 = abs(maximumR23 -minimumR23);
                         deltaR24 = abs(maximumR24 -minimumR24);
                         
                         deltaR31 = abs(maximumR31 -minimumR31);
                         deltaR32 = abs(maximumR32 -minimumR32);
                         deltaR33 = abs(maximumR33 -minimumR33);
                         deltaR34 = abs(maximumR34 -minimumR34);
                         
                         deltaR41 = abs(maximumR41 -minimumR41);
                         deltaR42 = abs(maximumR42 -minimumR42);
                         deltaR43 = abs(maximumR43 -minimumR43);
                         deltaR44 = abs(maximumR44 -minimumR44);
                        

                         stop = (deltaR11<=threshold_stopping)&&(deltaR12<=threshold_stopping)&&(deltaR13<=threshold_stopping)&&(deltaR14<=threshold_stopping)&&(deltaR21<=threshold_stopping)&&(deltaR22<=threshold_stopping)&&(deltaR23<=threshold_stopping)&&(deltaR24<=threshold_stopping)&&(deltaR31<=threshold_stopping)&&(deltaR32<=threshold_stopping)&&(deltaR33<=threshold_stopping)&&(deltaR34<=threshold_stopping)&&(deltaR41<=threshold_stopping) && (deltaR42<=threshold_stopping)&& (deltaR43<=threshold_stopping)&&(deltaR44<=threshold_stopping);


                         if(stop)
                             trained = 1;
                         end
                     end
                 else 

                     break;

                 end
            end
          %  sMatrix(iteration,:) = sVector;
            
            
    
    end

%smean = mean(sMatrix);


