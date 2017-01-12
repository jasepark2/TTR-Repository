function [SSS] = TTR_SMA0_TWO(T,SMA1,SMA2,b)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% This function covers two moving average cross-over with band logic.

 TT=T+1;
 SSS=zeros(TT,1);
    for t=1:T 
        if(SMA1(t,1)>(1+b)*SMA2(t,1))
		    S=1;
       	elseif(SMA1(t,1)<(1-b)*SMA2(t,1))
		    S=-1;
		else
            S=0;
        end
            SSS(t,1)=S;
    end
end

