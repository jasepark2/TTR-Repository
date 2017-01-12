function [sssLRI] = lri(data,period)
% Function to calculate the linear regression indicator of a data set.
% (The end point of the regression not the slope)
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the indicator
%
% Example:
% out = lri(data,period)
%

% Error check
if nargin ~= 2
    error([mfilename,' requires 2 inputs.']);
end
[m,n]=size(data);
if ~(m==1 || n==1)
    error(['The data input to ',mfilename,' must be a vector.']);
end
if (numel(period) ~= 1) || (mod(period,1)~=0)
    error('The period must be a scalar integer.');
end
if length(data) < period
    error('The length of the data must be at least the specified ''period''.');
end

% ensure data is a column
if n~=1
    data = data(:);
end

% preallocate the output
ld = length(data);
out = nan*ones(ld,1);
pinvX = pinv([(1:period)' ones(period,1)]);
% can't avoid a loop
slope=zeros(length(data),1);
for idx = period:ld
    % solve y = mx+b
    %mb = polyfit([1:period]',data(idx-period+1:idx),1);
    %out(idx) = polyval(mb,period);
    % The following is about 100 times faster than the above
    slope(idx) = [period 1]*pinvX*data(idx-period+1:idx);
end
        
n=length(data);
slope(1:period-1)= data(1:period-1);

smaLGI=ema(slope,period);

S=zeros(length(data),1);
for t=1:length(data);
if data(t)> smaLGI(t) S(t)=1;
elseif data(t)< smaLGI(t) S(t)=-1;
else S(t)=0 ;
end
sssLRI=S;
end
end

