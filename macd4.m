function [sssMACD4]= macd4(price,p1,p2,p3,p4)

% calculate the MACD4
mavg1 = ema(price,p1)-ema(price,p2);
% Need to be careful with handling NaN's in the second calculation
idx = isnan(mavg1);

   sig1 = [mavg1(idx); 
   ema(mavg1(~idx),p3)];
   sig2 = [mavg1(idx);
   ema(mavg1(~idx),p4)];
   MACD4 = sig1-sig2;

   n=length(MACD4);
   del=isnan(MACD4);
   MACD4(del)=0;

   TT=length(price);
   S=zeros(TT,1);
   for i=1:TT;
     if (MACD4(i)< 0)  S(i)=-1;
     elseif(MACD4(i)>0) S(i)=1;
     else S(i)=0;
     end
     S;
     sssMACD4=S;
   end
sssMACD4;
end
    
    
