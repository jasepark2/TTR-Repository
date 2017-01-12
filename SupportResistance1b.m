function [S] = SupportResistance1b(oldS,t,pt_extrema,pt_holding_period,e,b,c,Prices)
% This is perting C++ code of B and O (2010), FDR paper
%alternative defintion of extrema, constant holding period, percentage band filter


	if((t-pt_holding_period)<c)
  		S=oldS;
	else 
		max=FindHigh2(Prices, pt_extrema, t-1, e);
		min=FindLow2(Prices, pt_extrema, t-1, e);
		if(max~=-1 && Prices(t)>(1+b)*max) 
			S=1;
			pt_holding_period=t;
			pt_extrema=t+c-1;
        elseif(min~=-1 && Prices(t)<(1-b)*min) 
            S=-1;
			pt_holding_period=t;
			pt_extrema=t+c-1;
		 else
			S=0;
        end
    end
end

