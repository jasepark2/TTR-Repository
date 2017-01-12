function [low] = FindLow2(Prices, t_begin, t_end, e)
% This is perting C++ code of B and O (2010), FDR paper
% the most recent closing that is less than the e previous closing prices.
% e= {1,2,3,4,5,10,15,20}

flag=0; % 0= No, it's not subsequent low , 1= Yes, itsl current low!!
t=0;

while (flag==0 & t_begin<=(t_end-t-e)) 
		flag=1; % I means it's current low!!!
		low=Prices(t_end-t);
		i=1;
		while(i<=e & flag==1) 
			if(low>Prices(t_end-t-i))
				flag=0; % No, it's not low and let find next one !!
            end
			    i=i+1;
        end
		t=t+1;        
end
	if(flag==1)
		low=low;
	else
		low=-1;
    end
	    
end
