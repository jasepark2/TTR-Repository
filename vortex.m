function [sssVTX] = vortex(High, Low, Close, period)
% This is Vortex Indicator, VI function
%http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:vortex_indicator
% This version : 15 Apr.,2014

t=length(High);
pVM=zeros(t,1);
nVM=zeros(t,1);

for i=2:t
pVM(i)=abs(High(i)-Low(i-1)); % positive VM
nVM(i)=abs(Low(i)-High(i-1));% negative VM
end

ptvVM=zeros(t,1);
ntvVM=zeros(t,1);

for i=2:t-period+1
ptvVM(i+period-1)=sum(pVM(i:i+period-1)); % positive VM
ntvVM(i+period-1)=sum(nVM(i:i+period-1));% negative VM
end

TR=zeros(t,1); %True Range
for i=2:t
HL(i)=High(i)-Low(i);% High-Low
HC(i)=abs(High(i)-Close(i-1)); 
LC(i) = abs(Low(i)-Close(i-1));
TR(i)= max(HL(i), max(HC(i), LC(i)));% max of three
end

sumTR=zeros(t,1); %True Range
for i=2:t-period+1
sumTR(i+period-1)=sum(TR(i:i+period-1)) ;
end

pVI=zeros(t,1); % positive Vortex Indicator
nVI=zeros(t,1); % positive Vortex Indicator

for i=period+1:t
pVI(i)= ptvVM(i)/sumTR(i); % positive VM
nVI(i)= ntvVM(i)/sumTR(i); % negative VM
end

% to generate signal using pVI & nVI

T=length(High);
S=zeros(T,1);
for i=1:T;
   if pVI(i)> nVI(i)  S(i)=1;
   elseif pVI(i)<nVI(i)  S(i)=-1;
   else S(i)=0;
   end
S;

sssVTX=S;

end

