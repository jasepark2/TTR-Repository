function [sssRSI] = rsi(price,period,upper)
% Function to calculate the KDJ

 [RSI]= indicators(price,'rsi',period);

T=length(price);
S=zeros(T,1);
for i=1:T;
   if (RSI(i)> upper)  S(i)=-1;
   elseif(RSI(i)<(100-upper)) S(i)=1;
   else S(i)=0;
   end
sssRSI=S;
end
sssRSI;
end
