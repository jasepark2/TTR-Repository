function [sssPMO] = pmo(price,sPeriod,fPeriod,sigPeriod)
% Price Momentum Oscillator, PMO
%http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:dppmo
%two times EMA of ROC 
%PMO = 20 EMA (10 * 35 EMA(((Today's Price/Yesterday's Price)*100)-100))
%Signal Line: 10 period EMA of PMO
%example : pmo(Close,35,20)

ROC= indicators(price,'roc',1);
EMA1= indicators(price,'ema',sPeriod);
EMA1(isnan(EMA1))=0;
EMA2= EMA1*10;
EMA2(isnan(EMA2))=0;
PMO= indicators(EMA2,'ema',fPeriod);
PMO(isnan(PMO))=0;
Signal= indicators(PMO,'ema',sigPeriod);
Signal(isnan(Signal))=0;

TT=length(price);
S=zeros(TT,1);
for i=1:TT;
   if (PMO(i)>Signal(i))  S(i)=1;
   elseif(PMO(i)<Signal(i)) S(i)=-1;
   else S(i)=0;
   end
end
sssPMO=S;
end
