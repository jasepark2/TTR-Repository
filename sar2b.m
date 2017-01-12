function [S] = sar2b(oldS,t,pt_extrema,pt_holding_period,e,d,c,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
%alternative def of extrema, constant holding period, time delay filter

	if((t-pt_holding_period)<c)
  		S=oldS;
	else 
		S=1;
		i=0;
		while(i<d && S~=0)
			max=FindHigh2(Prices, pt_extrema, t-1-i, e);
			min=FindLow2(Prices, pt_extrema, t-1-i, e);
			if(min==-1 && max==-1)
				S=0;
            end
			if(i==0 && max~=-1 && Prices(t)>max)
				S=1;
            elseif(i==0 && min~=-1 && Prices(t)<min)
				S=-1;
            elseif((S==1 && max==-1) || (S==-1 && min==-1) || (min~=-1 && Prices(t-i)>min && S==-1) || (max~=-1 && Prices(t-i)<max && S==1))
				S=0;
            end
            i=i+1;
        end
		if(S~=0) 
			pt_holding_period=t;
			pt_extrema=t+c-1;
		
        end
    end
end

