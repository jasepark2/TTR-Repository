function [sssSTRVI] = stocRVI(Open,High,Low,Close,k,d, upper)
% This is combination of Cyber Cycle ans Stochastic Oscillator
% Example: stocRVI(Open,High,Low,Close,20,5,upper) % k>d

n=length(Close);
dUp=ones(n,1)*nan;
dDn=ones(n,1)*nan;

% calculate UP and DOWN

gap1=Close-Open;
gap2=High-Low;

for j=4:n
dUp(j)=(gap1(j)+2*gap1(j-1)+2*gap1(j-2)+gap1(j-3))/6;
dDn(j)=(gap2(j)+2*gap2(j-1)+2*gap2(j-2)+gap2(j-3))/6;
end

UP=sma(dUp,k);
DN=sma(dDn,k);

% calculate sma on UP and DOWN

%RVI=sma(dUp,period)./sma(dDn,period);
RVI=UP./DN;

%Calculate Stochastic Cyber Cycle;
Close_RV=RVI;
Low_RV=lowlow(Close_RV,k)'; 
High_RV=highhigh(Close_RV,k)';
 
[sSTO]= indicators([High_RV,Low_RV,Close_RV],'ssto',k,d);

TT=length(Close);
S=zeros(TT,1);

for i=1:TT;
   if (sSTO(i,1)>upper)  S(i)=-1;
   elseif(sSTO(i,1)<(100-upper)) S(i)=1;
   else S(i)=0;
   end
end
sssSTRVI=S;
end





