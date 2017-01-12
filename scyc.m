function [sssSTCC] = scyc(High, Low,Alpha,k,d,upper)
% This is combination of Cyber Cycle ans Stochastic Oscillator
% Example: stocCCycle(High, Low,20,5) % k>d
% calculate Cyber Cycle

price = (High+Low)/2;   % Compute the price as the mid-point between high and low.
T = size(price,1); % The sample size.
 
%####### Compute the smoothed price series #######
price = (High+Low)/2;   % Compute the price as the mid-point between high and low.
T = size(price,1); % The sample size.
%####### Compute the smoothed price series #######

smooth = zeros(T,1);   % Initialise a vector to store the smoothed prices.
for t = 4:T
	smooth(t) = (price(t) + 2*price(t-1) + 2*price(t-2) + price(t-3))/6; %# This...
end %# ...is the smoothing formula taken from the code on p.34 of Ehlers (2004).

%####### Compute the cycle #######
cycle = zeros(T,1);		%# Initialise a vector to store the cycle.
for t = 3:6
	cycle(t) = (price(t) - 2*price(t-1) + price(t-2))/4; %# These are the formulas taken from Ehlers (2004, p.34)).
end

%####### Compute the cycle #######
cycle = zeros(T,1);		%# Initialise a vector to store the cycle.
for t = 3:6
	cycle(t) = (price(t) - 2*price(t-1) + price(t-2))/4; %# These are the formulas taken from Ehlers (2004, p.34)).
end

for t = 7:T
	cycle(t) = (1-0.5*Alpha)*(1-0.5*Alpha)*(smooth(t) - 2*smooth(t-1) + smooth(t-2)) + 2*(1-Alpha)*cycle(t-1) - (1-Alpha)*(1-Alpha)*cycle(t-2);
end


%Calculate Stochastic Cyber Cycle;
Close_CC=cycle;
Low_CC=lowlow(Close_CC,k)'; 
High_CC=highhigh(Close_CC,k)';
 
[sSTO]= indicators([High_CC,Low_CC,Close_CC],'ssto',k,d);

TT=length(High);
S=zeros(TT,1);
for i=1:TT;
   if (sSTO(i,1)>upper) ;
       S(i)=-1; %if k>upper, sell
   elseif(sSTO(i,1)<(100-upper));
       S(i)=1;
   else S(i)=0;
   end
end
sssSTCC=S;
end