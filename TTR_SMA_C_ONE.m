function [SSS] = TTR_SMA_C_ONE(R,T,SMA,Price,c,max_c)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% This function covers price and one moving average cross-over with band logic.

 TT=T+1;
 SSS=zeros(TT,1);
 oldS=0;
 t_holding_period=R-max_c;
		
        for t=R:T 
            if((t-t_holding_period)<c)
  		       S=oldS;
               t_holding_period=t;
            else 
		       if(SMA(t,1)>Price(t,1))
			    S=1;
			elseif(SMA(t,1)<Price(t,1))
			    S=-1;
            else
                S=0;
            end
            SSS(t,1)=S;
            end
        SSS(t,1)=S;
        oldS=S;
        end
end

