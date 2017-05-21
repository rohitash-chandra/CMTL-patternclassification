
 function [TransSol] = MapSol(Sol1, Sol2, H1, H2,   Tp) 
 
             
  S1W1 = (Tp(1) * H1)+H1; 
  S1W2 = (H1 * Tp(3))+Tp(3);
 
 S2W1 = (Tp(1) * H2)+H2; 
  S2W2 = (Tp(3) * H2)+Tp(3); 
 
             InHidS1 = Sol1(1: S1W1  ) % all input to hid weights in SP1
             HidOutS1 = Sol1( S1W1+1 :end)
             
             InHidS2 = Sol2(1: S2W1  ) %   SP1
           HidOutS2 = Sol2( S2W1+1 :end -((H2-H1)*Tp(3) )) % SP2 
             X = InHidS2(S1W1+1:end - Tp(3)) % whatever is left at end of InHidS2 
             BOut = InHidS2(end - Tp(3) +1:end );
              
             WOut = Sol2(end - (  Tp(3)*(H2-H1))+1:end)   % weight links from added H to Output
             
                   TransSol =  horzcat(InHidS1, HidOutS2,X, WOut, BOut)
             
              
end
