function [high] = FindHigh2(Prices, t_begin, t_end, e)
% This is perting C++ code of B and O (2010), FDR paper
% the most recent closing that is greater than the e previous closing prices.
% e= {1,2,3,4,5,10,15,20}

% e= extrema
flag=0; % flag=0, no position, flag=1; % have position
t=0;

while (flag==0) & (t_begin<=(t_end-t-e)) 
		flag=1;
		high=Prices(t_end-t);
		i=1;
		while(i<=e & flag==1) 
		   if(high<Prices(t_end-t-i))
			  flag=0;
           end
           i=i+1;
        end
		t=t+1;
end
	if(flag==1)
		high=high;
	else
		high=-1;
    end
	    
end
