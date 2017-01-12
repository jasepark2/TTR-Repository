function [SSS] = TTR_SMA1_TWO(R, T, SMA1, SMA2,b,c, max_c)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% This function covers two moving average cross-over with constant holding
% c, and band logic.

 TT=T+1;
 SSS=zeros(TT,1);
 oldS=0;
 t_holding_period=R-max_c;
		
        for t=R:T 
            if((t-t_holding_period)<c)
  		       S=oldS;
               t_holding_period=t;
            else 
		        if(SMA1(t,1)>(1+b)*SMA2(t,1))
			       S=1;
			       t_holding_period=t;
                elseif(SMA1(t,1)<(1-b)*SMA2(t,1))
			       S=-1;
			       t_holding_period=t;
                else
                    S=0;
                end
            end
        SSS(t,1)=S;
        oldS=S;
        end
end

