function [sma_val] = sma(Price,period)
% Function to calculate the simple moving average of a data set
% This is based on the Matlab toolbox
% http://kr.mathworks.com/help/finance/tsmovavg.html#zmw57dd0e188829
% Example:
% sma = sma(Price,period)%

[n m]=size(Price);

 if n>m % If Price is column-oriented, transpose.
        sma_val  = tsmovavg(Price,'s',period,1);
 else
        sma_val  = tsmovavg(Price','s',period,1);
 end
% convert the period to an exponential percentage
end







