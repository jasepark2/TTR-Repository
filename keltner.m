function [sssKelt] = keltner(High,Low,Close,emaPeriod,atrMultiplication,atrperiod)
% Function to calculate the KDJ

[Kelt] = indicators([High,Low,Close],'keltner',emaPeriod,atrMultiplication,atrperiod);
middle = Kelt(:,1);
upper  = Kelt(:,2);
lower  = Kelt(:,3);

%apply band,b on upper and lower ??
T=length(High);
S=zeros(T,1);
for i=1:T;
    if     (Close(i)> upper(i)) S(i)=-1;
   elseif (Close(i) <lower(i)) S(i)=1;
   else S(i)=0;
end
S;
sssKelt=S;
end
sssKelt;
end
