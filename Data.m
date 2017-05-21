function [InputTrain, TargetTrain,InputTest, TargetTest] = Data(problem, step, Topology) 

if problem == 1
    load   Data/Wine/rtrain.txt;  
    load   Data/Wine/rtest.txt;    
    input = Topology(1);
    output = Topology(3);
  end
 
    if problem == 2
    load   Data/Iris/rtrain.txt;  
    load   Data/Iris/rtest.txt;    
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
