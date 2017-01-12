function [sssPPO] = ppo(Close,sPeriod, nfast, nslow)
% This is Percentage Price Oscillator,PPO function
% http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:price_oscillators_pp
% This version : 16 Apr.,2014
%a PPO result of 10 means the short-term average is 10% above the long-term average. 
%[sssPPO] = ppo(9,12,26,Close);


fastEMA=ema(Close,nfast);
slowEMA=ema(Close,nslow);

PPO= ((fastEMA-slowEMA)./slowEMA)*100;
PPO(isnan(PPO))=0;
Signal= ema(PPO,sPeriod) ;
Signal(isnan(Signal))=0;

S=zeros(length(Close),1);
for t=2:length(Close);
if PPO(t)>Signal(t) S(t)=1;
elseif PPO(t)<Signal(t) S(t)=-1;
else S(t)=0 ;
end
end
sssPPO=S;
end
