function [S] = afr4(oldS,t,pt_extrema,x,y,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
%AFR is alexander's filter rule alexander(1961)
% "Price Movements in Speculative Markets : Trends or Random walks"
% afr4() include y, another definition if extrema

	switch(oldS) 
	case 1
		high=FindHigh(Prices, pt_extrema, t-1);
		if((Prices(t)-high)/high < -x) 
		  	S=-1;
		  	pt_extrema=t;
        elseif((Prices(t)-high)/high < -y) 
		  	S=0;
		  	%*pt_extrema=t;
		else
		    S=oldS;
        end;
        
	case -1
		low=FindLow(Prices, pt_extrema, t-1);
        if((Prices(t)-low)/low > x) 
		  	S=1;
		  	pt_extrema=t;
        elseif((Prices(t)-low)/low > y) 
		  	S=0;
		  	%*pt_extrema=t;
		else
		  	S=oldS;
        end;
% case 0:
otherwise
    
		high=FindHigh(Prices,pt_extrema, t-1);
		low=FindLow(Prices, pt_extrema, t-1);
		if((Prices(t)-low)/low > x) 
		 	S=1;
		 	pt_extrema=t;
        elseif((Prices(t)-high)/high < -x) 
		 	S=-1;
		 	pt_extrema=t;
		else
		 	S=oldS;
        end
    end
end

