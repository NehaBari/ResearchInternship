

    for iteration = 1: 10
      
        
        load('genErrsmallconvergedmatrix.mat');
        load('genErrsmallpleatuematrix.mat');
        load('R_convergedmatrix.mat');
        
        
        % loading final mat files
        load('RPlotpleatue.mat');
        load('RPlotconverged.mat');
        
        
        K=5;% No. of hidden units in the hidden layer
        N=600; %Number of features in the dataset or no. of nodes/neurons in the input layer 
        alpha = 17;
        learning_rate = 0.8;
        P= ceil(alpha* K*N); % numb2er of examples in the dataset
        trainSteps = 9* 10^4;
        
        dataset = randn(N,P);
        gen_error = [];
        
        % stopping criteria
        window_stopping = 100;
        threshold_stopping = .001;
        trained = 0;
        
         R_11 = [];
         R_12 = [];
         R_13 = [];
         R_14 = [];
         R_15 = [];

          
         R_21 = [];
         R_22 = [];
         R_23 = [];
         R_24 = [];
         R_25 = [];

         
         R_31 = [];
         R_32 = [];
         R_33 = [];
         R_34 = [];
         R_35= [];


         R_41 = [];
         R_42 = [];
         R_43 = [];
         R_44 = [];
         R_45 = [];

         
         R_51 = [];
         R_52 = [];
         R_53 = [];
         R_54 = [];
         R_55 = [];


         Q_11 = [];
         Q_12 = [];
         Q_13 = [];
         Q_14 = [];
         Q_15 = [];

        
         Q_21 = [];
         Q_22 = [];
         Q_23 = [];
         Q_24 = [];
         Q_25 = [];

         
         
         Q_31 = [];
         Q_32 = [];
         Q_33 = [];
         Q_34 = [];
         Q_35= [];


         Q_41 = [];
         Q_42 = [];
         Q_43 = [];
         Q_44 = [];
         Q_45 = [];

         Q_51 = [];
         Q_52 = [];
         Q_53 = [];
         Q_54 = [];
         Q_55 = [];

       
         sVector = [];
         costarray = [];
         
         strInitType = 'with overlap';
         %R = zeros(K, K);

         
         [teacher_weights,student_weights] = studentTeacherInit(K,N,strInitType);
                  
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
                     
                     

                    
                     R_11 = [R_11;R(1,1)];
                     R_12 = [R_12;R(1,2)];
                     R_13 = [R_13;R(1,3)];
                     R_14 = [R_14;R(1,4)];
                     R_15 = [R_15;R(1,5)];

%                      
                     
                     R_21 = [R_21;R(2,1)];
                     R_22 = [R_22;R(2,2)];
                     R_23 = [R_23;R(2,3)];
                     R_24 = [R_24;R(2,4)];
                     R_25 = [R_25;R(2,5)];

                           
                     
                     
                     R_31 = [R_31;R(3,1)];
                     R_32 = [R_32;R(3,2)];
                     R_33 = [R_33;R(3,3)];
                     R_34 = [R_34;R(3,4)];
                     R_35 = [R_35;R(3,5)];


                     
                     
                     R_41 = [R_41;R(4,1)];
                     R_42 = [R_42;R(4,2)];
                     R_43 = [R_43;R(4,3)];
                     R_44 = [R_44;R(4,4)];
                     R_45 = [R_45;R(4,5)];

                      
                      R_51 = [R_51;R(5,1)];
                      R_52 = [R_52;R(5,2)];
                      R_53 = [R_53;R(5,3)];
                      R_54 = [R_54;R(5,4)];
                      R_55 = [R_55;R(5,5)];

                     

                     
                     Q_11 = [Q_11;Q(1,1)];
                     Q_12 = [Q_12;Q(1,2)];
                     Q_13 = [Q_13;Q(1,3)];
                     Q_14 = [Q_14;Q(1,4)];
                     Q_15 = [Q_15;R(1,5)];

                     
                     Q_21 = [Q_21;Q(2,1)];
                     Q_22 = [Q_22;Q(2,2)];
                     Q_23 = [Q_23;Q(2,3)];
                     Q_24 = [Q_24;Q(2,4)];
                     Q_25 = [Q_25;Q(2,5)];

                     
                     Q_31 = [Q_31;Q(3,1)];
                     Q_32 = [Q_32;Q(3,2)];
                     Q_33 = [Q_33;Q(3,3)];
                     Q_34 = [Q_34;Q(3,4)];
                     Q_35 = [Q_34;Q(3,5)];

                     
                     
                     Q_41 = [Q_41;Q(4,1)];
                     Q_42 = [Q_42;Q(4,2)];
                     Q_43 = [Q_43;Q(4,3)];
                     Q_44 = [Q_44;Q(4,4)];
                     Q_45 = [Q_45;Q(4,5)];

                     
                     
                     Q_51 = [Q_51;Q(5,1)];
                     Q_52 = [Q_52;Q(5,2)];
                     Q_53 = [Q_53;Q(5,3)];
                     Q_54 = [Q_54;Q(5,4)];
                     Q_55 = [Q_55;Q(5,5)];
      
                     student_weights = student_weights_trained;
                     gen_error = [gen_error;gen_error1];
                     % minimum 100 training steps required
%                      if(window_stopping<n)
% 
%                          maximumR11 = max(R_11(end-window_stopping:end));
%                          maximumR12 = max(R_12(end-window_stopping:end));
%                          maximumR13 = max(R_13(end-window_stopping:end));
%                          maximumR14 = max(R_14(end-window_stopping:end));
%                          maximumR15 = max(R_15(end-window_stopping:end));
%                          
%                          maximumR21 = max(R_21(end-window_stopping:end));
%                          maximumR22 = max(R_22(end-window_stopping:end));
%                          maximumR23 = max(R_23(end-window_stopping:end));
%                          maximumR24 = max(R_24(end-window_stopping:end));
%                          maximumR25 = max(R_25(end-window_stopping:end));
%                          
%                          maximumR31 = max(R_31(end-window_stopping:end));
%                          maximumR32 = max(R_32(end-window_stopping:end));
%                          maximumR33 = max(R_33(end-window_stopping:end));
%                          maximumR34 = max(R_34(end-window_stopping:end));
%                          maximumR35 = max(R_35(end-window_stopping:end));
%                         
%                          maximumR41 = max(R_41(end-window_stopping:end));
%                          maximumR42 = max(R_42(end-window_stopping:end));
%                          maximumR43 = max(R_43(end-window_stopping:end));
%                          maximumR44 = max(R_44(end-window_stopping:end));
%                          maximumR45 = max(R_45(end-window_stopping:end));
%                          
%                          maximumR51 = max(R_51(end-window_stopping:end));
%                          maximumR52 = max(R_52(end-window_stopping:end));
%                          maximumR53 = max(R_53(end-window_stopping:end));
%                          maximumR54 = max(R_54(end-window_stopping:end));
%                          maximumR55 = max(R_55(end-window_stopping:end));
%                          
% 
% 
%                          
% 
%                          minimumR11 = min(R_11(end-window_stopping:end));
%                          minimumR12 = min(R_12(end-window_stopping:end));
%                          minimumR13 = min(R_13(end-window_stopping:end));
%                          minimumR14 = min(R_14(end-window_stopping:end));
%                          minimumR15 = min(R_15(end-window_stopping:end));
%                          
%                          
%                          
%                          minimumR21 = min(R_21(end-window_stopping:end));
%                          minimumR22 = min(R_22(end-window_stopping:end));
%                          minimumR23 = min(R_23(end-window_stopping:end));
%                          minimumR24 = min(R_24(end-window_stopping:end));
%                          minimumR25 = min(R_25(end-window_stopping:end));
%                         
%                          
%                          minimumR31 = min(R_31(end-window_stopping:end));
%                          minimumR32 = min(R_32(end-window_stopping:end));
%                          minimumR33 = min(R_33(end-window_stopping:end));
%                          minimumR34 = min(R_34(end-window_stopping:end));
%                          minimumR35 = min(R_35(end-window_stopping:end));
%                          
%                          minimumR41 = min(R_41(end-window_stopping:end));
%                          minimumR42 = min(R_42(end-window_stopping:end));
%                          minimumR43 = min(R_43(end-window_stopping:end));
%                          minimumR44 = min(R_44(end-window_stopping:end));
%                          minimumR45 = min(R_45(end-window_stopping:end));
%                                                   
%                          
%                          minimumR51 = min(R_51(end-window_stopping:end));
%                          minimumR52 = min(R_52(end-window_stopping:end));
%                          minimumR53 = min(R_53(end-window_stopping:end));
%                          minimumR54 = min(R_54(end-window_stopping:end));
%                          minimumR55 = min(R_55(end-window_stopping:end));
% 
%                          deltaR11 = abs(maximumR11-minimumR11);
%                          deltaR12 = abs(maximumR12 -minimumR12);
%                          deltaR13 = abs(maximumR13 -minimumR13);
%                          deltaR14 = abs(maximumR14 -minimumR14);
%                          deltaR15 = abs(maximumR15 -minimumR15);
%                          
%                          deltaR21 = abs(maximumR21-minimumR21);
%                          deltaR22 = abs(maximumR22-minimumR22);
%                          deltaR23 = abs(maximumR23 -minimumR23);
%                          deltaR24 = abs(maximumR24 -minimumR24);
%                          deltaR25 = abs(maximumR25 -minimumR25);
%                          
%                          
%                          deltaR31 = abs(maximumR31 -minimumR31);
%                          deltaR32 = abs(maximumR32 -minimumR32);
%                          deltaR33 = abs(maximumR33 -minimumR33);
%                          deltaR34 = abs(maximumR34 -minimumR34);
%                          deltaR35 = abs(maximumR35 -minimumR35);
%                       
%                          deltaR41 = abs(maximumR41 -minimumR41);
%                          deltaR42 = abs(maximumR42 -minimumR42);
%                          deltaR43 = abs(maximumR43 -minimumR43);
%                          deltaR44 = abs(maximumR44 -minimumR44);
%                          deltaR45 = abs(maximumR45 -minimumR45);
%                          
%                          deltaR51 = abs(maximumR51 -minimumR51);
%                          deltaR52 = abs(maximumR52 -minimumR52);
%                          deltaR53 = abs(maximumR53 -minimumR53);
%                          deltaR54 = abs(maximumR54 -minimumR54);
%                          deltaR55 = abs(maximumR55 -minimumR55);
%                     
%                           stop1 = (deltaR11<=threshold_stopping)&&(deltaR12<=threshold_stopping)&&(deltaR13<=threshold_stopping)&&(deltaR14<=threshold_stopping)&&(deltaR15<=threshold_stopping);%&&(deltaR16<=threshold_stopping)&&(deltaR17<=threshold_stopping);%&&(deltaR18<=threshold_stopping);
%                          
%                          
%                          
%                          stop2 = (deltaR21<=threshold_stopping)&&(deltaR22<=threshold_stopping)&&(deltaR23<=threshold_stopping)&&(deltaR24<=threshold_stopping)&&(deltaR25<=threshold_stopping);%&& (deltaR26<=threshold_stopping)&&(deltaR27<=threshold_stopping);%&&(deltaR28<=threshold_stopping);
%                          
%                          
%                          stop3 = (deltaR31<=threshold_stopping)&&(deltaR32<=threshold_stopping)&&(deltaR33<=threshold_stopping)&&(deltaR34<=threshold_stopping)&&(deltaR35<=threshold_stopping);%&&(deltaR36<=threshold_stopping)&&(deltaR37<=threshold_stopping);%&&(deltaR38<=threshold_stopping);
%                          
%                          
%                          
%                          stop4 = (deltaR41<=threshold_stopping)&&(deltaR42<=threshold_stopping)&&(deltaR43<=threshold_stopping)&&(deltaR44<=threshold_stopping)&&(deltaR45<=threshold_stopping);%&&(deltaR46<=threshold_stopping)&&(deltaR47<=threshold_stopping);%&&(deltaR48<=threshold_stopping);
%                          
%                           
%                          stop5 = (deltaR51<=threshold_stopping)&&(deltaR52<=threshold_stopping)&&(deltaR53<=threshold_stopping)&&(deltaR54<=threshold_stopping)&&(deltaR55<=threshold_stopping);%&&(deltaR56<=threshold_stopping)&&(deltaR57<=threshold_stopping);%&&(deltaR58<=threshold_stopping);
%                          
%                                                  
%                          
%                          
%                          
%                          
% 
% 
%                           if(stop1 && stop2 && stop3 && stop4 && stop5 )
%                              trained = 1;
%                          end
%                      end
            end
            

            R = [R_11,R_12,R_13,R_14,R_15,R_21,R_22,R_23,R_24,R_25,R_31,R_32,R_33,R_34,R_35,R_41,R_42,R_43,R_44,R_45,R_51,R_52,R_53,R_54,R_55];
            
            genErrsmallpleatuematrix(iteration,13) = gen_error(11000);
            save('genErrsmallpleatuematrix.mat','genErrsmallpleatuematrix');
            
            genErrsmallconvergedmatrix(iteration,13) = gen_error(end);
            save('genErrsmallconvergedmatrix.mat','genErrsmallconvergedmatrix');
            
            
            % stores values for all iterations for pleatue states for R.
            % Per mat file one matrix present
            R_pleatuematrix(iteration,:) = [R_11(11000),R_12(11000),R_13(11000),R_14(11000),R_15(11000),R_21(11000),R_22(11000),R_23(11000),R_24(11000),R_25(11000),R_31(11000),R_32(11000),R_33(11000),R_34(11000),R_35(11000),R_41(11000),R_42(11000),R_43(11000),R_44(11000),R_45(11000),R_51(11000),R_52(11000),R_53(11000),R_54(11000),R_55(11000)];
            save('R_pleatuematrix.mat','R_pleatuematrix');
            
            
            % stores values for all iterations for converged states for R.
            % Per mat file one matrix present
            R_convergedmatrix(iteration,:) = [R_11(end),R_12(end),R_13(end),R_14(end),R_15(end),R_21(end),R_22(end),R_23(end),R_24(end),R_24(end),R_31(end),R_32(end),R_33(end),R_34(end),R_35(end),R_41(end),R_42(end),R_43(end),R_44(end),R_45(end),R_51(end),R_52(end),R_53(end),R_54(end),R_55(end)];
            save('R_convergedmatrix.mat','R_convergedmatrix');
             
            R_11_plot_pleatue(iteration,13) = R_11(11000);
            R_12_plot_pleatue(iteration,13) = R_12(11000);
            R_13_plot_pleatue(iteration,13) = R_13(11000);
            R_14_plot_pleatue(iteration,13) = R_14(11000);            
            R_15_plot_pleatue(iteration,13) = R_15(11000);
            
            
            R_21_plot_pleatue(iteration,13) = R_21(11000);
            R_22_plot_pleatue(iteration,13) = R_22(11000);
            R_23_plot_pleatue(iteration,13) = R_23(11000);
            R_24_plot_pleatue(iteration,13) = R_24(11000);
            R_25_plot_pleatue(iteration,13) = R_25(11000);
          
            R_31_plot_pleatue(iteration,13) = R_31(11000);
            R_32_plot_pleatue(iteration,13) = R_32(11000);
            R_33_plot_pleatue(iteration,13) = R_33(11000);
            R_34_plot_pleatue(iteration,13) = R_34(11000);
            R_35_plot_pleatue(iteration,13) = R_35(11000);
           
            
            R_41_plot_pleatue(iteration,13) = R_41(11000);
            R_42_plot_pleatue(iteration,13) = R_42(11000);
            R_43_plot_pleatue(iteration,13) = R_43(11000);
            R_44_plot_pleatue(iteration,13) = R_44(11000);
            R_45_plot_pleatue(iteration,13) = R_45(11000);
            
            R_51_plot_pleatue(iteration,13) = R_51(11000);
            R_52_plot_pleatue(iteration,13) = R_52(11000);
            R_53_plot_pleatue(iteration,13) = R_53(11000);
            R_54_plot_pleatue(iteration,13) = R_54(11000);
            R_55_plot_pleatue(iteration,13) = R_55(11000);
          
            save('RPlotpleatue.mat','R_11_plot_pleatue','R_12_plot_pleatue','R_13_plot_pleatue','R_14_plot_pleatue','R_15_plot_pleatue','R_21_plot_pleatue','R_22_plot_pleatue','R_23_plot_pleatue','R_24_plot_pleatue','R_25_plot_pleatue','R_31_plot_pleatue','R_32_plot_pleatue','R_33_plot_pleatue','R_34_plot_pleatue','R_35_plot_pleatue','R_41_plot_pleatue','R_42_plot_pleatue','R_43_plot_pleatue','R_44_plot_pleatue','R_45_plot_pleatue','R_51_plot_pleatue','R_52_plot_pleatue','R_53_plot_pleatue','R_54_plot_pleatue','R_55_plot_pleatue');
            
            R_11_plot_con(iteration,13) = R_11(end);
            R_12_plot_con(iteration,13) = R_12(end);
            R_13_plot_con(iteration,13) = R_13(end);
            R_14_plot_con(iteration,13) = R_14(end);
            R_15_plot_con(iteration,13) = R_15(end);
           
            R_21_plot_con(iteration,13) = R_21(end);
            R_22_plot_con(iteration,13) = R_22(end);
            R_23_plot_con(iteration,13) = R_23(end);
            R_24_plot_con(iteration,13) = R_24(end);
            R_25_plot_con(iteration,13) = R_25(end);
           
            R_31_plot_con(iteration,13) = R_31(end);
            R_32_plot_con(iteration,13) = R_32(end);
            R_33_plot_con(iteration,13) = R_33(end);
            R_34_plot_con(iteration,13) = R_34(end);
            R_35_plot_con(iteration,13) = R_35(end);
           
            
             R_41_plot_con(iteration,13) = R_41(end);
             R_42_plot_con(iteration,13) = R_42(end);
             R_43_plot_con(iteration,13) = R_43(end);
             R_44_plot_con(iteration,13) = R_44(end);
             R_45_plot_con(iteration,13) = R_45(end);
          
             R_51_plot_con(iteration,13) = R_51(end);
             R_52_plot_con(iteration,13) = R_52(end);
             R_53_plot_con(iteration,13) = R_53(end);
             R_54_plot_con(iteration,13) = R_54(end);
             R_55_plot_con(iteration,13) = R_55(end);
             save('RPlotconverged.mat','R_11_plot_con','R_12_plot_con','R_13_plot_con','R_14_plot_con','R_15_plot_con','R_21_plot_con','R_22_plot_con','R_23_plot_con','R_24_plot_con','R_25_plot_con','R_31_plot_con','R_32_plot_con','R_33_plot_con','R_34_plot_con','R_35_plot_con','R_41_plot_con','R_42_plot_con','R_43_plot_con','R_44_plot_con','R_45_plot_con','R_51_plot_con','R_52_plot_con','R_53_plot_con','R_54_plot_con','R_55_plot_con');
%             
            % saving the mat files

            filename2 = '/home/nehabari/Videos/antispecialization/RELU/antispecialization/Alpha17/matfiles';
            save(fullfile(filename2,['Alpha_',num2str(alpha),'_',num2str(iteration)]));

            
            % saving plots
             plots(alpha,gen_error,trainSteps,R,iteration,costarray,K,N);
             clear all;
             clc;
    end




