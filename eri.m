function [sigERI]= eri(High, Low, Close,period)
% Function to calculate the Elder Ray Indicator
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the momentum
%
% Example:
%

 EMA=ema(Close,13);
 
 T=length(High);
 for i=1:T;
 Bull(i)= High(i)- EMA(i);
 Bear(i)= Low(i)- EMA(i);
 end
 
EMA=ema(Close,period);

T=length(High);
S=zeros(T,1);

for i=1:T;
   if (Close(i)< EMA(i)&& Bear(i)<0)  S(i)=-1;
   elseif (Close(i)> EMA(i)&& Bull(i)>0) S(i)=1;
   else S(i)=0;
end
S;
sigERI=S;
end
 sigERI;
 end

