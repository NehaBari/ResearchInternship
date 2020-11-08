
%%
%alphaArray = [5];
%alphas = 21;
alphaArray = [0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,3.25,3.5,3.75,4,4.25,4.5,4.75,5,5.25,5.5,5.75,6,7,8,9,10,11,12,13,14,15,16,17];
%%

%for alphas = 1:size(alphaArray,2)
    
    for iteration = 1: 30
 
        load('genErrsmallconvergedmatrix.mat');
        load('genErrsmallpleatuematrix.mat');
        load('R_convergedmatrix.mat');
        
        
        % loading final mat files
        load('RPlotpleatue.mat');
        load('RPlotconverged.mat');
        
        %iterations = 15;
        K=2;% No. of hidden units in the hidden layer
        N=100; %Number of features in the dataset or no. of nodes/neurons in the input layer 
        alpha = 5;%alphaArray(alphas);
        learning_rate = 0.5;
        P= ceil(alpha* K*N); % number of examples in the dataset

        trainSteps = 2.5 * 10^4;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
         
         strInitType = 'with overlap';
       %  R = zeros(K, K);
          R = eye(K) * 0.2;
         [student_weights, teacher_weights] = studentTeacherInit(R,K,N,strInitType);
                  
         if (strcmp(strInitType,'with overlap'))
              % overlap code column vector
              student_weights = student_weights';
              teacher_weights = teacher_weights';
              disp('in overlap')
         end 
            %Computing the teacher outputs of the dataset before the training. 
            % tou is the final output column vector for all teacher
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
                     
                     % subsampling for calculating Training Error
                     if  rem(n, 300) == 0
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


               
                     student_weights = student_weights_trained;
                     gen_error = [gen_error;gen_error1];
                     % minimum 100 training steps required
%                      if(window_stopping<n)
% 
%                          maximumR11 = max(R_11(end-window_stopping:end));
%                          maximumR12 = max(R_12(end-window_stopping:end));
% 
%                          maximumR21 = max(R_21(end-window_stopping:end));
%                          maximumR22 = max(R_22(end-window_stopping:end));
% 
% 
% 
% 
%                          minimumR11 = min(R_11(end-window_stopping:end));
%                          minimumR12 = min(R_12(end-window_stopping:end));
% 
%                          minimumR21 = min(R_21(end-window_stopping:end));
%                          minimumR22 = min(R_22(end-window_stopping:end));
% 
% 
% 
%                          deltaR11 = abs(maximumR11-minimumR11);
%                          deltaR12 = abs(maximumR12 -minimumR12);
% 
%                          deltaR21 = abs(maximumR21-minimumR21);
%                          deltaR22 = abs(maximumR22-minimumR22);
% 
%                         
% 
%                          stop = (deltaR11<=threshold_stopping)&&(deltaR12<=threshold_stopping)&&(deltaR21<=threshold_stopping)&&(deltaR22<=threshold_stopping);
% 
% 
%                          if(stop)
%                              trained = 1;
%                          end
%                      end
            end
            

             R = [R_11,R_12,R_21,R_22];
            
            genErrsmallpleatuematrix(iteration,alphas) = gen_error(2500);
            save('genErrsmallpleatuematrix.mat','genErrsmallpleatuematrix');
            
            genErrsmallconvergedmatrix(iteration,alphas) = gen_error(22000);
            save('genErrsmallconvergedmatrix.mat','genErrsmallconvergedmatrix');
                 
            
            
            R_pleatuematrix(iteration,:) = [R_11(2500),R_12(2500),R_21(2500),R_22(2500)];
            save('R_pleatuematrix.mat','R_pleatuematrix');
           
            R_convergedmatrix(iteration,:) = [R_11(22000),R_12(22000),R_21(22000),R_22(22000)];
            save('R_convergedmatrix.mat','R_convergedmatrix');
            
            R_11_plot_pleatue(iteration,alphas) = R_11(2500);
            R_12_plot_pleatue(iteration,alphas) = R_12(2500);
            R_21_plot_pleatue(iteration,alphas) = R_21(2500);
            R_22_plot_pleatue(iteration,alphas) = R_22(2500);
            save('RPlotpleatue.mat','R_11_plot_pleatue','R_12_plot_pleatue','R_21_plot_pleatue','R_22_plot_pleatue');
            
            R_11_plot_con(iteration,alphas) = R_11(22000);
            R_12_plot_con(iteration,alphas) = R_12(22000);
            R_21_plot_con(iteration,alphas) = R_21(22000);
            R_22_plot_con(iteration,alphas) = R_22(22000);
            save('RPlotconverged.mat','R_11_plot_con','R_12_plot_con','R_21_plot_con','R_22_plot_con');
            
            % saving the mat files
            

           % filename2 = '/home/nehabari/Videos/Finalcode/latest/July17Email/Code/Alpha1/matfiles';


            filename = '/home/nehabari/Videos/Finalcode/latest/July17Email/Code/';
            filename1 = fullfile(filename,['Alpha',num2str(alpha)],'matfiles');
            save(fullfile(filename1,['Alpha_',num2str(alpha),'_',num2str(iteration)]));

            
            % saving plots
             plots(alpha,gen_error,trainSteps,R,iteration,costarray,K,N,filename);
             clearvars -except alphaArray alphas;
             clc;
    end
    
%end



