function [S] = sar2a(oldS,t,pt_holding,pt_e,e,b,c,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% SAR includes n,e,b,c,d., SAR=100+800+320=1220.

   if (t-pt_holding)<c %if within holding period
  		S=oldS;
   else
		max=FindHigh2(Prices,pt_e, t-1,e);
		min=FindLow2(Prices, pt_e, t-1,e);
		if(max~=-1 & Prices(t)>(1+b)*max)
			S=1;
			pt_holding=t;
			pt_e=t+c-1;
        elseif (min~=-1) & (Prices(t)<(1-b)*min)
            S=-1;
			pt_holding=t;
			pt_e=t+c-1;
		else
			S=0;
        end
   end
end
