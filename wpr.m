function sigWPR = wpr(High,Low,Close,period,upper)
% Function to calculate the william %R

WPR = indicators([High,Low,Close],'william',period);
T=length(High);
 for i=1:T
    if WPR(i)<-100, WPR(i)=-100;
    else WPR(i) = WPR(i);
    end
 end

S=zeros(T,1);
for i=1:T;
   if (WPR(i)>upper)  S(i)=-1;
   elseif(WPR(i)<-100-upper) S(i)=1;
   else S(i)=0;
   end
S;
end
sigWPR=S;
end
