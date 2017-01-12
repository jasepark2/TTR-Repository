function [S] = sma2(t,nslow,nfast,d,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% sma2() is for two MAs, delay period filter

S=1;
i=0;
  while(i<d && S~=0)
		slow_avrg=Average(Prices, t-nslow+1-i, t-i);
		fast_avrg=Average(Prices, t-nfast+1-i, t-i);
		if(i==0 && fast_avrg>slow_avrg)
			S=1;
        elseif(i==0 && fast_avrg<=slow_avrg)
			S=-1;
        elseif((fast_avrg>slow_avrg && S==-1) || (fast_avrg<=slow_avrg && S==1))
			S=0;
        end
        i=i+1;
  end
  
end

