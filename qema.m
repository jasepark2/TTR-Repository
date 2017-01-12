function [QEMA]= qema(price,period)
% Function to calculate the "Quadruple" exponential moving average of a data set
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the average
%
% Example:
% out = qema(data,period)
%

data=price;

% Error check
if nargin ~= 2
    error([mfilename,' requires 2 inputs.']);
end
[m,n]=size(data);
if ~(m==1 || n==1)
    error(['The data input to ',mfilename,' must be a vector.']);
end
if (numel(period) ~= 1)
    error('The period must be a scalar.');
end

% calculate the EMA
EMA1 = ema(data,period);
% calculate the EMA of the EMA
EMA2=nan*ones(size(data));
EMA2(period:end)=ema(EMA1(period:end),period);
% calculate EMA on EMA on EMA
EMA3=nan*ones(size(data));
EMA3(period*2-1:end)=ema(EMA2(period*2-1:end),period);

% calculate EMA on EMA on EMA on EMA, 4 times
EMA4=nan*ones(size(data));
EMA4(period*3-2:end)=ema(EMA3(period*3-2:end),period);

% calculate EMA on EMA on EMA on EMA on EMA, 5 times
EMA5=nan*ones(size(data));
EMA5(period*4-3:end)=ema(EMA4(period*4-3:end),period);

% calculate the Quadruple  ema
QEMA = 5*EMA1-10*EMA2 + 10*EMA3 - 5*EMA4 + EMA5;

end




