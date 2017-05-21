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
     
      
      
    
 TRAIN=rtrain;
 TEST= rtest; 
   
 
  data  =  TEST; 
  trainA = TRAIN;
  
  InputTrain  =   trainA(1:end , 1:step); 
  TargetTrain =  trainA(1:end , input+1:input+  output);  
  
   
   InputTest  =  data(1:end,  1:input); 
   TargetTest  =  data(1:end, input+1:input + output);
     
    
end
