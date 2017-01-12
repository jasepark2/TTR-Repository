function [DeMarker]= demarker(High,Low,period)

[n m] = size(High);

for i=2:n;
if High(i)>High(i-1);
 DeMax(i) = High(i)-High(i-1);    
else
    DeMax(i) = 0;
end
end

for i=2:n;
if Low(i)< Low(i-1);
 DeMin(i) = Low(i-1)-Low(i);    
else
    DeMin(i) = 0;
end
end

maxSMA=sma(DeMax,period);
minSMA=sma(DeMin,period);
maxSMA(isnan(maxSMA))=0;
minSMA(isnan(minSMA))=0;

DeMarker = 100*(maxSMA./(maxSMA+minSMA));

T=length(High);
S=zeros(1,T-1);
for i=1:T;
   if (DeMarker(i)> 70)  S(i)=-1;
   elseif(DeMarker(i)<30) S(i)=1;
   else S(i)=0;
end
S;
S(end)=[];
sssDeMark=[0,S];
end
DeMarker=sssDeMark';
end
    
    
