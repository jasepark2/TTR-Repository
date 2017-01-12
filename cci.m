function out = cci(High,Low, Close,period, meanDev)

const=0.015; 
cci= indicators([High,Low,Close],'cci',period, meanDev,const);

T=length(High);
S=zeros(T,1);
for i=1:T;
   if cci(i)>100 S(i)=-1;
   elseif cci(i)<-100 S(i)=1;
   else S(i)=0;
end
sssCCI=S;
out=sssCCI;
end;
