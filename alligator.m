function [sssAlligator] = alligator(High,Low,period1,period2,period3)
%http://www.forextraders.com/forex-indicators/alligator-indicator-explained.html
%http://www.tradingsetupsreview.com/trading-alligator-by-bill-williams/
% Blue=13 days SSMA
% Red= 8 days SSMA
% Green = 8 days SSMA
% period1> period2>period3

price=(High+Low)/2;
blue  =smma(High,Low,period1);
red   =smma(High,Low,period2);
green =smma(High,Low, period3);

T=length(price);
S=zeros(T,1);
for i=1:T; 
   if (green(i)< blue(i) && red(i) < blue(i))  S(i)=-1;
   elseif(green(i)>blue(i) && red(i)> blue(i)) S(i)=1;
   else S(i)=0;
end
sssAlligator=S;
end

