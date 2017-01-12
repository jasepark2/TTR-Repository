function [PEMA] = pema(price,period)
% Function to calculate the " Pentuple" exponential moving average of a data set
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the average
%
% Example:
% out = pema(data,period)
%

% Error check
if nargin ~= 2
    error([mfilename,' requires 2 inputs.']);
end
[m,n]=size(price);
if ~(m==1 || n==1)
    error(['The data input to ',mfilename,' must be a vector.']);
end
if (numel(period) ~= 1)
    error('The period must be a scalar.');
end

% calculate the EMA
EMA1 = ema(price,period);
% calculate the EMA of the EMA
EMA2=nan*ones(size(price));
EMA2(period:end)=ema(EMA1(period:end),period);
% calculate EMA on EMA on EMA
EMA3=nan*ones(size(price));
EMA3(period*2-1:end)=ema(EMA2(period*2-1:end),period);

% calculate EMA on EMA on EMA on EMA, 4 times
EMA4=nan*ones(size(price));
EMA4(period*3-2:end)=ema(EMA3(period*3-2:end),period);

% calculate EMA on EMA on EMA on EMA on EMA, 5 times
EMA5=nan*ones(size(price));
EMA5(period*4-3:end)=ema(EMA4(period*4-3:end),period);

% calculate EMA on EMA on EMA on EMA on EMA on EMA, 6 times
EMA6=nan*ones(size(price));
EMA6(period*5-4:end)=ema(EMA5(period*5-4:end),period);

% calculate EMA on EMA on EMA on EMA on EMA on EMA on EMA, 7 times
EMA7=nan*ones(size(price));
EMA7(period*6-5:end)=ema(EMA6(period*6-5:end),period);

% calculate EMA on EMA on EMA on EMA on EMA on EMA on EMA on EMA, 8 times
EMA8=nan*ones(size(price));
EMA8(period*7-6:end)=ema(EMA7(period*7-6:end),period);

% calculate the Quadruple  ema
PEMA = 8*EMA1-28*EMA2 + 56*EMA3 -70*EMA4 + 56*EMA5 - 28*EMA6 + 8*EMA7 - EMA8;

end




