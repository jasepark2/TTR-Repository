function [sssVR] = vr(High,Low,Close,period,level)
%http://daytrading.about.com/od/indicators/a/VolatilityRatio.htm
%The Volatility Ratio (VR) is a comparison of the current true range (TR)
% and a specific length of the previous true range (PR).
%Calculation :
%TR = (HIGH - LOW | HIGH - CLOSE-1 | CLOSE-1 - LOW)
%PR = (HIGH(H ... Hn | CLOSE-1) - LOW(L ... Ln) | CLOSE-1)
%VR = TR / PR
%example : vr(High,Low,Close,20,0.5)

[VR] = indicators([High,Low,Close],'vr',period);
[ARN] = aroon(High, Low,period);

S=zeros(length(High),1);
for t=1:length(High);
if (ARN(t)==1 && VR(t)> level) S(t) =-1;
elseif(ARN(t)==-1 && VR(t)> level) S(t) =1;
else S(t)=0; 
end
end
sssVR=S;
end
