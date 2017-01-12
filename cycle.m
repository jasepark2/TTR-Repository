function [sssCYC] = cycle(High,Low, Alpha)
%######################################################################
%# My implementation of the cybercycle indicator from Ehlers, J.F.(2004)
%# "Cybernetic Analysis for Stocks and Futures"
%#
%#                          Chris Heaton, February 2014.
%########################################################################

% calculate Cyber Cycle

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
for t = 7:T
	cycle(t) = (1-0.5*Alpha)*(1-0.5*Alpha)*(smooth(t) - 2*smooth(t-1) + smooth(t-2)) + 2*(1-Alpha)*cycle(t-1) - (1-Alpha)*(1-Alpha)*cycle(t-2);
end

%####### Compute the trigger #######

trigger = [cycle(2:T);0]; %# The trigger is the lagged value of the cycle (see last line of Ehlers (2004, p.34).

%####### Generate the trading signals #######

signal = (cycle>=trigger) - (trigger>cycle);% # +1 if the cycle is above the trigger; -1 otherwise.
signal(1:2) = 0; signal(T) = 0;  %# Set the missing values to NA.

sssCYC=signal;

end


