clear all;
clc;


iterations = 1;
K=2;% No. of hidden units in the hidden layer
N=200; %Number of features in the dataset or no. of nodes/neurons in the input layer 
alpha = 10;
learning_rate = 0.5;
P= ceil(alpha* K*N); % number of examples in the dataset

trainSteps = P*5;



    for iteration = 1: iterations
        
        
        sMatrix = zeros(iterations,trainSteps);
        dataset = randn(N,P);
        gen_error = [];
        
        % stopping criteria
        window_stopping = 100;
        threshold_stopping = .001;
        trained = 0;
         R_11 = [];
         R_12 = [];
         R_13 = [];
         R_21 = [];
         R_22 = [];
         R_23 = [];
         
         Q_11 = [];
         Q_12 = [];
         Q_13 = [];
         Q_21 = [];
         Q_22 = []; 
         Q_23 = [];
         
         sVector = [];
         costarray = [];

         %I removed the normalization of the data
         
         strInitType = 'with overlap';
         %R = [8.995 * 10^-3, 0; 0, 8.995 * 10^-3];
         R = zeros(K, K);
         [student_weights, teacher_weights] = studentTeacherInit(R,K,N,strInitType);
           
        %This is not necessary because you can already choose length 1
        %student and teacher vectors in "studentTeacherInit", there I
        %adapted Q to be [1, 0; 0, 1];
%          for kk = 1:size(student_weights,2)
%             student_weights(:,kk) = student_weights(:,kk)/norm(student_weights(:,kk));
%             teacher_weights(:,kk) = teacher_weights(:,kk)/norm(teacher_weights(:,kk));
%          
%          end
         
         if (strcmp(strInitType,'with overlap'))
              % overlap code column vector
              student_weights = student_weights';
              teacher_weights = teacher_weights';
              disp('in overlap')
         end 
            %Computing the teacher outputs of the dataset before the training. 
            % tou1 is the final output column vector for all teacher
            % examples
            % local_potential_student is a matrix, storing local potential
            % per example in a column vector.
            [tou,local_potential_teacher] = ForwardPropagate(dataset,K,teacher_weights);
            
            % Training starts
            for n = 1:trainSteps
                     i = randi(P);

                     X = dataset(:,i);

                     [psi,local_potential_student] = ForwardPropagate(X,K,student_weights);
                     [R,Q,gen_error1,student_weights_trained] = orderparameterRELU(student_weights,teacher_weights,K,N,psi,tou,learning_rate,i,local_potential_student,X);
                     
                     if  rem(n, 100) == 0
                     trainerror = training_error(K,tou,student_weights,dataset);
                     costarray = [costarray;trainerror];
                     end
                     
                     %
                     s = abs(R(1,1)-R(1,2)) + abs(R(2,1)-R(2,2));
                    
                     R_11 = [R_11;R(1,1)];
                     R_12 = [R_12;R(1,2)];

                     R_21 = [R_21;R(2,1)];         
                     R_22 = [R_22;R(2,2)];


                     
                     Q_11 = [Q_11;Q(1,1)];
                     Q_12 = [Q_12;Q(1,2)];

                     Q_21 = [Q_21;Q(2,1)];
                     Q_22 = [Q_22;Q(2,2)];


                     sVector = [sVector;s];
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
            end
            sMatrix(iteration,:) = sVector;
            
            
    
    end

smean = mean(sMatrix);


