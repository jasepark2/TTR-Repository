function [DEMA] = demaRule(price,period)
% Function to calculate the double exponential moving average of a data set
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the average
% Example: out = dema(data,period)

emavg = ema(price,period);
% calculate the EMA of the EMA
EMAemavg = nan*ones(size(price));
EMAemavg(period:end) = ema(emavg(period:end),period);
% calculate the double ema
DEMA = 2*emavg-EMAemavg;
end

