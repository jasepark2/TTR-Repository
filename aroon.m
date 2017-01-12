function [sssARN] = aroon(High, Low,period)
% Function to calculate the aroon

%calculation

ARN = indicators([High, Low],'aroon',period);
DN=ARN(:,1);
UP=ARN(:,2);

T=length(High);
S=zeros(T,1);
for i=1:T;
   if (ARN(i,1)> ARN(i,2))  S(i)=-1;
   elseif(ARN(i,1)<ARN(i,2)) S(i)=1;
   else S(i)=0;
   end
end
sssARN=S;
end