function [low] = FindLow(Prices, t_begin, t_end)
% This is perting C++ code of B and O (2010), FDR paper
%   Detailed explanation goes here

    low=Prices(t_begin);
	for t=t_begin+1:t_end 
		if (Prices(t)<low) 
			low=Prices(t);
	    end
    end
end

