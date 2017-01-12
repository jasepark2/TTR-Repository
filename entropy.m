function [sigEntropy]= entropy(price,period)
% Function to calculate the Elder Ray Indicator
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the momentum
%
% Example:
%

[r c]=size(price);
rates_total=r;
begin=2;
first=period+begin;

in=0;  %price;
out=0; %entropy;
count = r;
Bar=r;
count=r;
T=length(price);

for(i=first:rates_total)
      sumx=0;sumx2=0;avgx =0; rmsx = 0.0;
         
      for(jjj=1:period)
         kkk=i-jjj;
         Price0 = price(kkk);
         Price1 = price(kkk - 1);

         fPrice=log(Price0/Price1);
         sumx= sumx + fPrice;
         sumx2 = sumx2 + fPrice*fPrice;
      end
             
      avgx = sumx / period;
      rmsx = sqrt(sumx2/period);
            
      P = (1 + avgx/rmsx)/2;
      G = P * log(1 + rmsx) + (1 - P) * log(1 - rmsx);
      Entropy(i)=G;
end

for i=1:T;
   if     (Entropy(i) <0 ) S(i)=-1;
   elseif (Entropy(i) >0 ) S(i)=1;
   else S(i)=0;
end
sigEntropy=S;
end
sigEntropy;
 end

