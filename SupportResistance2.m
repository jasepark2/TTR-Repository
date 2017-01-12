function [S] = SupportResistance2(oldS,t,pt_holding_period,n,b,c,Prices)
% This is perting C++ code of B and O (2010), FDR paper
% first defintion of extrema, constant holding period, percentage band filter

	if((t-pt_holding_period)<c)
  		S=oldS;
	else 
		max=FindHigh(Prices, t-n, t-1);
		min=FindLow(Prices, t-n, t-1);
		if(Prices(t)>(1+b)*max) 
			S=1;
			pt_holding_period=t;
        elseif(Prices(t)<(1-b)*min) 
            S=-1;
			pt_holding_period=t;
		else
			S=0;
			
        end
    end
end

