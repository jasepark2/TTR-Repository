function [sssCoppock] = coppock (price,fastPeriod,slowPeriod,smaPeriod)

ROC1 = indicators(price,'roc',fastPeriod);
ROC2 = indicators(price,'roc',slowPeriod);
twoROC=ROC1+ROC2;
Coppock= wma(twoROC,smaPeriod);

T=length(price);
S=zeros(T,1);
for i=1:T;
   if (Coppock(i)< 0)      S(i)=-1;
   elseif(Coppock(i)> 0)   S(i)=1;
   else S(i)=0;
   end
end
sssCoppock=S;
end
