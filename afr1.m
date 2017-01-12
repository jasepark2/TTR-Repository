function [S] = afr1(oldS,t,pt_extrema,x,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
%AFR is alexander's filter rule alexander(1961)
% "Price Movements in Speculative Markets : Trends or Random walks"
 switch(oldS) 
    case 1
		high=FindHigh(Prices,pt_extrema,t-1);
        if((Prices(t)-high)/high < -x) % if price drops by x% from high
            S=-1;                      % sell it    
            pt_extrema=t;
		else
            S=oldS;
        end;
        
	case -1
		low=FindLow(Prices, pt_extrema, t-1);
        if((Prices(t)-low)/low > x) % if price hike by x% from low
		  	S=1;                    %buy it
		  	pt_extrema=t;
		else
            S=oldS;
        end;
        
     case 0          % in case of neutral position
		high=FindHigh(Prices,pt_extrema,t-1);
		low=FindLow(Prices,pt_extrema,t-1);
		if((Prices(t)-low)/low > x)  % if price moves up by x%
		 	S=1;                     % buy it 
		 	pt_extrema=t;
        elseif((Prices(t)-high)/high <-x)  % if price moves down by x%
		 	S=-1;                          % sell it
		 	pt_extrema=t;
		else
		 	S=oldS;
        end
end

