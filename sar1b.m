function [S] = sar1b(oldS,t,pt_holding,n,c,d,Prices)
% This code is partially ported C++ code in Bajgrowicz and Scaillet(2012).
% http://www.sciencedirect.com/science/article/pii/S0304405X1200116X
% Also refer STW(1999) for more details
% http://onlinelibrary.wiley.com/doi/10.1111/0022-1082.00163/abstract
% sar1b includes n,c,d.
	if (t-pt_holding)<c ;% if within holding period
  		S=oldS;     % no changes in S  
    else 
        S=1;
        i=0;
        while(i<d && S~=0); %if within delay period
           RES=FindHigh(Prices,t-n-i,t-1-i) ; % resistance line, previous n days low
                                      % t-1 means not including today 
           SUP=FindLow(Prices,t-n-i,t-1-i);  ; % Supporting line, previous n days low        
           if(i==0 && Prices(t)<SUP);  % if supporting line breaks 
              S=-1;                   % sell it
           elseif(Prices(t-i)> SUP && S==-1)||(Prices(t-i)< RES && S==1)
			  S=0;  %within ranges, no signals
           end
              i=i+1;
        end
    end
           if (S~=0)
			   pt_holding=t; %save t when S happens
           end
    end
