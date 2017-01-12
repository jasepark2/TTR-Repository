function [S] = sma1(oldS,t,pt_holding,nslow,nfast,c,b,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% sma1() is for two MAs,constant holding period, percentage band filter

	if((t-pt_holding)<c)
  		S=oldS;
	else 
		slow_avrg=Average(Prices,t-nslow+1, t);
		fast_avrg=Average(Prices, t-nfast+1, t);
	     if(fast_avrg>(1+b)*slow_avrg) 
 			S=1;
 			pt_holding=t;
          elseif(fast_avrg<(1-b)*slow_avrg) 
			S=-1;
			pt_holding=t;
          else
			S=0;
          end
    end    
end

