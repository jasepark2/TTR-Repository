function [sssMACD] = macd(price,short,long,signal)
% Function to calculate the KDJ

[allMACD]= indicators(price,'macd',12,26,9);

MACD=allMACD(:,1);
Signal=allMACD(:,2);

T=length(price);
S=zeros(T,1);
for i=1:T;
   if (MACD(i)< Signal(i))  S(i)=-1;
   elseif(MACD(i)>Signal(i)) S(i)=1;
   else S(i)=0;
   end
sssMACD=S;
end
sssMACD;
end
