function [sssSSTO] = ssto(High,Low,Close,k,d)
% Function to calculate the fast Stochastic

[sSTO]= indicators([High,Low,Close],'ssto',k,d);

TT=length(High);
S=zeros(TT,1);
for i=1:TT;
   if (sSTO(i,1)>80)  S(i)=-1;
   elseif(sSTO(i,1)<20) S(i)=1;
   else S(i)=0;
end
sssSSTO=S;
end
end
