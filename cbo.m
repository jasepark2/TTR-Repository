function [S,pt_holding] = cbo(oldS,t,pt_holding,n,x,c,b,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% CBO includes holding period of c and percentage band,b.

	S=0;
	if (t-pt_holding)<c; % if within holding period c
  		S=oldS;  % no changes in signal
    else
        high=max(Prices(t-n:t-1)) ; % t-1 means not including today 
        low=min(Prices(t-n:t-1)) ; % previous n days low
        channel= (high-low)/low ; % high-low gap or channel
 
        if channel<=x % if previos n days market moved within lower*(1+x%) or x% channel.....
		   if(Prices(t)>high*(1+b)) % but today, if p(t)>upper channel, buy it 
			 S=1;
             pt_holding=t;
		   elseif(Prices(t)<low*(1-b)) % but today, if p(t)<lower channel, sell it 
			 S=-1;
            pt_holding=t;
           end
        end       
    end
end
