function [sssSTRSI] = stocRSI(price,k,d, upper)
% This is combination of Cyber Cycle ans Stochastic Oscillator

% Example: stocRSI(High, 20,5, 80) % k>d

% calculate Center of Gravity
 [RSI]= indicators(price,'rsi',upper);

%Calculate Stochastic Cyber Cycle;
Close_RS=RSI;
Low_RS=lowlow(Close_RS,k)'; 
High_RS=highhigh(Close_RS,k)';
 
[sSTO]= indicators([High_RS,Low_RS,Close_RS],'ssto',k,d);

TT=length(price);
S=zeros(TT,1);
for i=1:TT;
   if (sSTO(i,1)>upper)  S(i)=-1; % sell if k%>upper 
   elseif (sSTO(i,1)<(100-upper)) S(i)=1; % buy if k%<(1-upper) 
   else S(i)=0;
   end  

end
sssSTRSI=S;
end





