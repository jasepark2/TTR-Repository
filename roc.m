function [sssROC] = roc(price,period,upper)
% Function to calculate the Rate of Change

[ROC]= indicators(price,'roc',upper);

T=length(price);
S=zeros(T,1);
for i=1:T;
   if (ROC(i)> upper)  S(i)=-1;
   elseif(ROC(i)<-upper) S(i)=1;
   else S(i)=0;
   end
sssROC=S;
end
sssROC;
end
