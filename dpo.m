function [sssDPO] = dpo(price,period)
% Function to calculate the detrended price oscillator of a data set.
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the indicator
%
% Example:
% out = dpo(data,period)
%

% Error check
if nargin ~= 2
    error([mfilename,' requires 2 inputs.']);
end
[m,n]=size(price);
if ~(m==1 || n==1)
    error(['The data input to ',mfilename,' must be a vector.']);
end
if (numel(period) ~= 1) || (mod(period,1)~=0)
    error('The period must be a scalar integer.');
end
if length(price) < period
    error('The length of the data must be at least the specified ''period''.');
end

% Firstly calculate the SMA
SMA = sma(price,period);
% Move the data back (period/2)+1 periods
offset = floor(period/2+1);
% calculate the dpo
t = length(price);
DPO = nan*ones(t,1);

for i=period:t 
DPO(i) = price(i)-SMA(i-offset) ;
end

T=length(price);
S=zeros(T,1);
for i=1:T;
   if (DPO(i)< 0)  S(i)=-1;
   elseif(DPO(i)> 0) S(i)=1;
   else S(i)=0;
end

end
sssDPO=S;
end

