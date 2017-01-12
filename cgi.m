function [sssCGI] = cgi(Close,period)
% Function to calculate the "center of gravity" of a data set
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the average
% CG= SUM(i+1)*Price(i, N) / Sum(Price(i, N)
%   = WMA/SMA
% Trigger = sma(CG, new Period)
% cgi(Close,20,10)

% WMA
SMA=sma(Close,period);
WMA=wma(Close,period);
CGI=WMA./SMA;

S=zeros(length(Close),1);
for t=2:length(Close);
Signal(1)=NaN;
Signal(t) = CGI(t-1);

if CGI(t)>Signal(t) S(t)=1;
elseif CGI(t)<Signal(t) S(t)=-1;
else S(t)=0 ;
end
end
sssCGI=S;
end









