function [sssEMV] = emv(High,Low,Volume,maType,maPeriod,VolDivisor)
% Function to calculate the True Strength Index

TT=length(High);
Price=zeros(TT,1);
prevPrice=zeros(TT,1);
for i=2:TT;
    Price(i)=(High(i)+Low(i))./2;
    prevPrice(i)=(High(i-1)+Low(i-1))./2;
    volume(i)=Volume(i)/VolDivisor;
    EMV(i)=(Price(i)-prevPrice(i))/(volume(i)/(High(i)-Low(i)));
end

if maType=='SMA'
    maEMV=sma(EMV,maPeriod);
elseif maType=='WMA'
    maEMV=wma(EMV,maPeriod);
elseif maType=='WMA'
    maEMV=ema(EMV,maPeriod);
end
    
T=length(High);
S=zeros(T,1);
for i=1:T;
   if (EMV(i)< maEMV(i))  S(i)=-1;
   elseif(EMV(i)> maEMV(i)) S(i)=1;
   else S(i)=0;
end
S;
sssEMV=S;
end
sssEMV;
end
