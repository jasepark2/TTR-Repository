function [sssADX] = adx(High,Low,Close,period,index)

ADX= indicators([High,Low,Close],'adx',period);

pDI    = ADX(:,1);
mDI    = ADX(:,2);
sigADX = ADX(:,3);

T=length(High);
S=zeros(T,1);
for i=1:T;
   if     (pDI(i)< mDI(i))&& (sigADX(i)>index) S(i)=-1;
   elseif (pDI(i)> mDI(i))&& (sigADX(i)>index) S(i)=1;
   else    S(i)=0;
end
S;
sssADX=S;
end

end

