function [ATRband] = atrBand(High,Low,Close,period,multiple)
% Function to calculate the linear regression indicator of a data set.
% (The end point of the regression not the slope)
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the indicator
%

atr= indicators([High,Low,Close],'atr',period);

bandHigh=lri(Low,period)+ atr.*multiple;
bandMid=lri(Close,period);
bandLow=lri(High,period) - atr.*multiple;
        
T=length(High);
%apply band,b on upper and lower ??
S=zeros(T,1);

nPeriod=63;
filter=ema(Close,nPeriod);

for i=1:T;
   if     (Close(i)> bandHigh(i)) S(i)=-1;
   elseif (Close(i)< bandLow(i)) S(i)=1;
   else S(i)=0;
   end
S;
ATRband=S;
end

end

