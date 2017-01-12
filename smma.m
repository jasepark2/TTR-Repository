function [SMMA] = smma(High,Low,period)
% Function to calculate the smothed (sm) moving average (ma) of a data set
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the average

% Example:
% out = smma(data,period)

price=(High+Low)/2;

TT=length(price);
tempSUM1 = filter(ones(1,period),1,price);
tempSUM1=tempSUM1(period:TT);
temp=ones(period-1,1)*nan;
rollSUM= vertcat(temp,tempSUM1);
rollSMA=rollSUM/period;

%The second moving average is calculated according to this formula:
[row col] = size(rollSMA);

for i=1:row
SMMA (i) = (rollSUM(i)-rollSMA(i)+price(i))./period;
end

end

