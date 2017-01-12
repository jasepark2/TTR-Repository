function [sssTRIX] = trix(price,maPeriod,maType,sigPeriod)
% Function to calculate the True Strength Index

if maType=='SMA'
    MA1=sma(price,maPeriod);
elseif maType=='WMA'
    MA1=wma(price,maPeriod);
elseif maType=='EMA'
    MA1=ema(price,maPeriod);
end
    
if maType=='SMA'
    MA2=sma(MA1,maPeriod);
elseif maType=='WMA'
    MA2=wma(MA1,maPeriod);
elseif maType=='EMA'
    MA2=ema(MA1,maPeriod);
end
    
if maType=='SMA'
    MA3=sma(MA2,maPeriod);
elseif maType=='WMA'
    MA3=wma(MA2,maPeriod);
elseif maType=='EMA'
    MA3=ema(MA2,maPeriod);
end

TT=length(price);
TRIX=zeros(TT,1);
for i=2:TT
TRIX(i)= (MA3(i)-MA3(i-1))./MA3(i-1); 
zero=find(isnan(TRIX));
TRIX(zero)= 0;
end

signal=ema(TRIX,sigPeriod);

T=length(TRIX);
S=zeros(T,1);
for i=1:T;
   if (TRIX(i)< signal(i))  S(i)=-1;
   elseif(TRIX(i)> signal(i)) S(i)=1;
   else S(i)=0;
   end
end
sssTRIX=S;
end


