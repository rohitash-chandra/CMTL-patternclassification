% CCGA for FNN by Rohitash Chandra, 2016: c.rohitash(at)gmail.com
%note this is for hidden layer. But many other layer can be done

% can use for classfication and also for time series predition or
% regression. 



function Execute(prob) 

app = prob;

out1 = fopen(strcat(int2str(app) ,'out1.txt'), 'w');
out2 = fopen(strcat(int2str(app) ,'out2.txt'), 'w');

% Declare NN here

            
 NumSteps =  3;


MaxFE = 40000 * NumSteps ; % 4bit  
 

 MinError = [0.00000001]; %Min Error for each problem
 
 NumProb = 7;
 
  ProbMin = [-5]; % initial pop range
  ProbMax = [5];
   
  

In = [13, 4,  34, 16, 9, 4, 13, 4, 24, 15, 4, 9, 4] ; % state input for Wine, Iris, 6Bit
Hidd = [8, 5,  8, 6, 6, 5, 8, 14, 14, 18, 5, 28, 6];
Outdata = [3, 2, 1, 1, 1, 3, 1, 4, 4, 1, 1, 3]; % state out for each data
 
 Decom = 5; % type of decomposition of NN. 1 = Layer level, 2 = Network level, 3 = NSP, 4 = Synapse level, 5 is ESP

MaxRun = 3  ;

%for app = 8:9

    if app == 7
        MaxFE = MaxFE * 2;
    end
    
    if app == 8
        MaxFE = MaxFE * 3;
    end


    if app == 9
        MaxFE = MaxFE * 3;
    end
    
    
    if app == 10
        MaxFE = MaxFE * 3;
    end


  for depth = 8:4:8
        Suc = 0; % when minimum error is satisfied
        
        SucT1 = 0;
        SucT2 = 0;
        SucT3 = 0;
        
  for Run=1:MaxRun
           
           Input = [round(.6 *In(app)), round(.8 *In(app)), In(app)];  %  set of input size for different tasks
           Input
           Output = Outdata(app); 
 
           H  = [Hidd(app), (Hidd(app) +2), (Hidd(app) +4)];
 
           for t=1:NumSteps

            Topology{t} = [Input(t), H(t) , Output];
           Topology{t}
              
           end 
            
            H
           [Dimen, D] = SetCCNN(Topology{1},   H, Input);
            
           Dimen
          
            
         for step=1:NumSteps
                             
            [TrainInput{step}, TrainTarget{step},TestInput{step}, TestTarget{step}  ] = Data(app, Input(step), Topology{end});
            
            %[TrainInput{step}, TrainTarget{step},TestInput{step}, TestTarget{step}  ] = DataHPC(app, Input(step), Topology{end});


             net{step} = FNNetwork(  TrainInput{step}, TrainTarget{step},  TestInput{step}, TestTarget{step} ,  Topology{step}, Decom); 
         end 
            
           
           PopSize = round((4+floor(3*log(D(end))))) % use D for larged Hidden neurons
     
          CCGA = CooperativeCoevolution(PopSize,Dimen, app, ProbMax, ProbMin);   
       
   
      
    LocalFE = 1000;
        
    phase =1 
    
    CurrentFE = 1;
    
    
    BestEr = ones(1,NumSteps) 
        
    while CurrentFE < MaxFE & phase < 300
        
        depth = 10;
        
     CCGA = CooperativeCoevolution.CCEvolution( CCGA, LocalFE * phase,  depth, MinError,  Topology,  net); % pass FNN as net
       
        TotalFE   =   CooperativeCoevolution.GetFE(CCGA)    ;
        SolOne =  CooperativeCoevolution.GetSolution(CCGA); % gives whole solution
        FitList =  CooperativeCoevolution.GetFitList(CCGA) ; 
    
     MinFit  = min(FitList);
      
     
      for step=1:NumSteps  
         T1Solution{step} = CooperativeCoevolution.SeprateTaskSolution(CCGA,step); 
      end
     
     for step=1:NumSteps 
       TotalEr(step) =   FitList(step); 
   
       if TotalEr(step) < BestEr(step)
          BestEr(step) = TotalEr(step) 
          BestSolution{step} = T1Solution{step}; 
       end
     end
     
      BestEr
      FitList
      
      
     CurrentFE = TotalFE  
     
     phase = phase +1 
     %trans
    end
     
    
  for s=1:NumSteps   
    net{s} = FNNetwork.SaveTrainedNet(net{s}, BestSolution{s},  Topology, s); 
    net{s} =  FNNetwork. TestClassificationNetwork (net{s}) ;  
    T{s}.Test(Run) = FNNetwork. GetTrainClassPerf(net{s}); 
     Fit{s}.Error(Run) = FNNetwork. GetTestClassPerf(net{s}); 
  end
       
  
  
    fprintf(out1,'%d  %d %d \n',   app,  depth, Run); 
    
    for step=1:NumSteps  
     fprintf(out1, '%.6f  ', Fit{step}.Error(Run)); 
    end
    
      fprintf(out1,'\n'); 
      
    for step=1:NumSteps 
     fprintf(out1,'%.6f ',    T{step}.Test(Run));
    end
    
      fprintf(out1,'\n'); 
  end 
  
  
  for st=1:NumSteps 
      
      
         MeanTrain(st) = mean(Fit{st}.Error) ;
         STDTrain(st) = 1.96 *(std(Fit{st}.Error)/sqrt(MaxRun)) ;
         MeanTest(st) = mean(T{st}.Test) ;
         STDTest(st) = 1.96 *(std(T{st}.Test)/sqrt(MaxRun)) ;
  end
%      

     testmean = sum(MeanTest)/NumSteps ;
     
     trainmean = sum(MeanTrain)/NumSteps ;
%          
     teststd =    sum(STDTest)/NumSteps  ;
     
 
     trainstd =    sum(STDTrain)/NumSteps  ;
     
     fprintf(out2,'%d  %d \n',   app,  depth); 
     
     for step=1:NumSteps 
        fprintf(out2, '%.6f ',  MeanTrain(step));
     end
      fprintf(out2,'\n');  
      
     for step=1:NumSteps
        fprintf(out2, '%.6f ', STDTrain(step));
     end
     
      fprintf(out2,'\n'); 
      
     for step=1:NumSteps
     fprintf(out2, '%.6f ', MeanTest(step));
     end
     
      fprintf(out2,'\n'); 
      
     for step=1:NumSteps
     fprintf(out2, '%.6f ',  STDTest(step));
     end
     
      fprintf(out2,'\n \n'); 
     
      fprintf(out2,'%.6f %.6f %.6f %.6f \n \n \n', trainmean ,trainstd, testmean, teststd);

  end
%end


fclose(out1);
fclose(out2);

end
