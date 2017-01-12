function [S] = sar1a(oldS,t,pt_holding,n,c,b,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% sar1a() includes n,b,c, sar2a()includes e,b,c
% sar1b() includes n,c,d, sar2b()includes e,c,d
% SAR=100+800+320=1220.

	S=0;
	if (t-pt_holding)<c % if within holding period
  		S=oldS;     % no changes in S  
    else 
	  high=max(Prices(t-n:t-1)) ; % t-1 means not including today 
      low=min(Prices(t-n:t-1)) ; % previous n days low
      	if(Prices(t)>(1+b)*high); % buy if resistance breaks
			S=1;
			pt_holding=t;
        elseif(Prices(t)<(1-b)*low) % sell if support breaks
            S=-1;
			pt_holding=t;
		else
			S=0;
        end
    end
end
