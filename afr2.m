function [S] = afr2(oldS,t,pt_extrema,x,e,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
%AFR is alexander's filter rule alexander(1961)
% "Price Movements in Speculative Markets : Trends or Random walks"
% afr2()is alternative def of subsequent high/low, no neutral position
	    
    if oldS== 1 
    	high=FindHigh2(Prices, pt_extrema, t-1, e);
		if(high~=-1 && (Prices(t)-high)/high < -x) 
			S=-1;
			pt_extrema=t;
		else
            S=oldS;
        end;
        
    elseif oldS== -1
            
		low=FindLow2(Prices,pt_extrema, t-1, e);
		if(low~=-1 && (Prices(t)-low)/low > x) 
            S=1;
			pt_extrema=t;
		else
            S=oldS;
        end;
    else 
		high=FindHigh2(Prices,pt_extrema, t-1, e);
		low=FindLow2(Prices, pt_extrema, t-1, e);
		if(low~=-1 && (Prices(t)-low)/low > x) 
            S=1;
			pt_extrema=t;
        elseif(high~=-1 && (Prices(t)-high)/high < -x) 
            S=-1;
			pt_extrema=t;
		 else
		 	S=oldS;
        end

    end
	    
end

