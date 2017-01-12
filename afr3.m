function [S] = afr3(oldS,t,pt_extrema,pt_holding_period,x,c,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
%AFR is alexander's filter rule alexander(1961)
% "Price Movements in Speculative Markets : Trends or Random walks"
%afr3() covers constant holding period, first def of subsequent high/low

	if((t-pt_holding_period)<c) 
  		S=oldS;
	else 
		high=FindHigh(Prices, pt_extrema, t-1);
		low=FindLow(Prices,pt_extrema, t-1);
		if((Prices(t)-low)/low > x) 
		 	S=1;
		 	pt_holding_period=t;
			pt_extrema=t+c-1;
        elseif((Prices(t)-high)/high < -x) 
		 	S=-1;
		 	pt_holding_period=t;
			pt_extrema=t+c-1;
		else
		 	S=oldS;
        end
    end
end

