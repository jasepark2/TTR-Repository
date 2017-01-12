function [sssSTCG] = stocCGI(Close,k,d,upper)
% This is combination of Cyber Cycle ans Stochastic Oscillator
% Example: stocCGI(High, Low,20,5) % k>d
% calculate Center of Gravity
 [CGI] = cgi(Close,k);

%Calculate Stochastic Cyber Cycle;
Close_CG=CGI;
Low_CG=lowlow(Close_CG,k)'; 
High_CG=highhigh(Close_CG,k)';
 
[sSTO]= indicators([High_CG,Low_CG,Close_CG],'ssto',k,d);

TT=length(Close);
S=zeros(TT,1);
for i=1:TT;
   if (sSTO(i,1)>upper)
       S(i)=-1;
   elseif(sSTO(i,1)<(100-upper)) 
       S(i)=1;
   else S(i)=0;
   end
end
sssSTCG=S;
end





