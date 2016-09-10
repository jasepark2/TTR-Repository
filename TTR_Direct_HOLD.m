function [SSC] = TTR_Direct_HOLD(R,T,c,Default,max_c)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% This function is for keeping the signals for c days, while ignoring new
% signals

 TT=T+1;
 SSC=zeros(TT,1);
 oldS=0;
 t_holding_period=R-max_c;
		
        for t=R:T 
            if((t-t_holding_period)<c)
  		       S=oldS;
            else 
		        if Default(t,1)==1
			       S=1;
			       t_holding_period=t;
                elseif Default(t,1)==-1
			       S=-1;
			       t_holding_period=t;
                else
                    S=0;
                end
            end
        SSC(t,1)=S;
        oldS=S;
        end
end

