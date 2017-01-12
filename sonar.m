function [sssSONAR] = sonar( price,emaPeriod)
%Japanese momentum indicatore
%same as ROC formular but input data series is not close but EMA of close

TT=length(price);

EMA=ema(price,emaPeriod);

for i=emaPeriod+1:TT;
SONAR(i)=EMA(i) - EMA(i-emaPeriod);
end

S=zeros(TT,1);
for i=1:TT;
   if (SONAR(i)< 0)  S(i)=-1;
   elseif(SONAR(i)> 0) S(i)=1;
   else S(i)=0;
   end
S;
sssSONAR=S;
end
sssSONAR;
end

