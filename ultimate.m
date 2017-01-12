function [sssUO] = ultimate(High,Low,Close, sPeriod,mPeriod,fPeriod,fK,mK,sK)
%http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:ultimate_oscillator
%fPeriod=7;     %Fast ATR period
%mPeriod=14;  %Middle ATR period
%sPeriod=28;    %Slow ATR period
%fK=4; %Fast K
%mK=2; %Middle K
%sK=1; %Slow K
% [sssUO] = ultimate(High,Low,Close,28,14,7,4,2,1)

r=length(Close);

% BP= Buying Pressure, C-min(C,L))
  for i=2:r;
  BP(i)=Close(i)-min(Low(i),Close(i-1));
  BP;
  end
  
% Calculate True Range,TR
 
for i=2:r;
TrueMax(i) = max(High (i),Close (i - 1));
TrueMin(i) = min( Low(i),Close (i - 1));
TR(i) =TrueMax(i)- TrueMin(i);
end

% UO
% RawUO=Raw Ultimate Oscillator.
% UO = Ultimate Oscillator.  

AvgFast=rollSUM(BP,fPeriod)./rollSUM(TR,fPeriod);
AvgMiddle=rollSUM(BP,mPeriod)./rollSUM(TR,mPeriod);
AvgSlow=rollSUM(BP,sPeriod)./rollSUM(TR,sPeriod);

Divider=fK+mK+sK;
UO = 100*((fK*AvgFast)+ (mK*AvgMiddle) + (sK*AvgSlow))/Divider;
sssUltimate=UO';

T=length(Close);
S=zeros(T,1);
for i=1:T;
   if (UO(i)> 65)  S(i)=-1;
   elseif(UO(i)<35) S(i)=1;
   else S(i)=0;
end
S;
sssUO=S;
end
sssUO;
end
