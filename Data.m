function [InputTrain, TargetTrain,InputTest, TargetTest] = Data(problem, step, Topology)

   


if problem == 1
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Wine/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Wine/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
  end
 
    if problem == 2
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Iris/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Iris/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
    end
     
     
     if problem ==  3 
     load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Ions/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Ions/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
    end 
    
      if problem == 4 
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Zoo/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Zoo/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
      end
    
   if problem == 5 
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Cancer/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Cancer/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
   end
    
        if problem == 7
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Heart/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Heart/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end

    if problem == 6
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Lenses/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Lenses/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end
     
       if problem == 8
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Robot-Four/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Robot-Four/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end
     
     if problem == 9
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Robot-TwentyFour/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Robot-TwentyFour/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end
     
     
     if problem == 10
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/CreditApproval/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/CreditApproval/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end
     
     
     if problem == 11
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Baloon/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Baloon/rtest.txt;    
    input = Topology(1)
    output = Topology(3);
     end
      
      
      
     if problem == 12
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/TicTac/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/TicTac/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end
      
      
      
     if problem == 13
    load ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Balance/rtrain.txt;  
    load  ~/Dropbox/Experiments/2017/FNN-General-MTL/DevelopmentalLearning-Classification/BenchmarkComparisionSGD/Data/Balance/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
     end
      
      
    
 TRAIN=rtrain;
 TEST= rtest; 
   
 
  data  =  TEST; 
  trainA = TRAIN;
  
  InputTrain  =   trainA(1:end , 1:step); 
  TargetTrain =  trainA(1:end , input+1:input+  output);  
  
   
   InputTest  =  data(1:end,  1:input); 
   TargetTest  =  data(1:end, input+1:input + output);
     
   
%   
%    InputTrain
%    TargetTrain
%  Input5
%  Target5
%  Input7
%  Target7
end
