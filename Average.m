function [mean] = Average(DATA, t_begin, t_end)
% This is perting C++ code of B and O (2010), FDR paper
%   Detailed explanation goes here

mu=0;

for t=t_begin:t_end
   mu=mu+DATA(t);
	mean=mu/(t_end-t_begin+1);    
end  
end

