function [rollSUM] = rollSUM(price,period)

%error checking!!
[n,m]=size(price);
if (n>m) 
  error(['The data input to must be a row vector.']);
end

%calculation

TT=length(price);
winSUM = filter(ones(1,period),1,price);
temp=zeros(1,period-1);
rollSUM=[temp,winSUM(period:TT)];
end

