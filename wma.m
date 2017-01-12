function [wma_val] = wma(Price,period)
% Function to calculate the weighted moving average of a data set
% This is based on the Matlab toolbox
% http://kr.mathworks.com/help/finance/tsmovavg.html#zmw57dd0e188829
% Example:
% wma = wma(Price,period)%

[n m]=size(Price);

 if n>m % If Price is column-oriented, transpose.
        wma_val  = tsmovavg(Price,'w',period,1);
 else
        wma_val  = tsmovavg(Price','w',period,1);
 end
% convert the period to an exponential percentage
end







