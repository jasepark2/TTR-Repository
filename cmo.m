function [sssCMO] = cmo(price,period,smaPeriod)
% Function to calculate the Chande Momentum Oscillator
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the CCI
% smaPeriod= sma on CMO;
% Example:
% out = cmo(Close, 14,5)
%

% calculate the CMO

T=length(price);
up=indicators(price,'roc',1);

for i =1:T;
  if up(i)<0 DN(i)= abs(up(i));
  else DN(i)=0;
  end
  if up(i)>0 UP(i)=up(i);
  else UP(i)=0;
  end
end
 
 cumUP= sma(UP,period);
 cumDN= sma(DN,period);
 
for i =1:T;
CMO(i)=100 * (cumUP(i) - cumDN(i))/(cumUP(i) + cumDN(i));
end

Signal= sma(CMO, smaPeriod);

for i=1:T;
   if (CMO(i)< Signal(i))  S(i)=-1;
   elseif(CMO(i)> Signal(i)) S(i)=1;
   else S(i)=0;
end
S;
sssCMO=S;
end
end

