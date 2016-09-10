function [SSS] = TTR_Direct_DELAY(R,T,Default,d)
% This is perting C++ code of B and S (2012), FDR paper
% This function is for two MAs, constant holding period

 S=1;
	i=0;
    SSS=zeros(T+1,1);
    
    for t=R:T % check why R=2
          if (t>=R+d-1) 
               while(i<d && S~=0)
                    if(i==0 && Default(t,1)==1);
			           S=1;
                    elseif(i==0 && Default(t,1)==-1)
			           S=-1;
                    elseif(Default(t,1)==1 && S==-1) || (Default(t,1)==-1 && S==1)
			           S=0;
                    end
                    i=i+1
               end
               SSS(t,1)=S;
          end
    end
end

