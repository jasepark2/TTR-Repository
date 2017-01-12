function [sssTSI] = tsi(Close,period1,period2)
% Function to calculate the True Strength Index

TSI = indicators(Close,'tsi',period1,period2);

T=length(Close);
S=zeros(T,1);
for i=1:T;
   if (TSI(i)< 0)  S(i)=-1;
   elseif(TSI(i)> 0) S(i)=1;
   else S(i)=0;
end
S;
sssTSI=S;
end
sssTSI;
end
