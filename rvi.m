function [sssRVI] = rvi(Open,High,Low,Close,period)
% Function to calculate Relative Vigor Index
% RVI = (Close-Open)/(High-Low)
%Only buy if RVI > 50.
%Only sell if RVI < 50.

% Error check
if nargin ~= 5
    error([mfilename,' requires 2 inputs.']);
end
[m,n]=size(High);
if ~(m==1 || n==1)
    error(['The data input to ',mfilename,' must be a vector.']);
end
if (numel(period) ~= 1)
    error('The period must be a scalar.');
end

% calculate norm and denorm
n=length(Close);
dUp=ones(n,1)*nan;
dDn=ones(n,1)*nan;

% calculate UP and DOWN

gap1=Close-Open;
gap2=High-Low;

for j=4:n
dUp(j)=(gap1(j)+2*gap1(j-1)+2*gap1(j-2)+gap1(j-3))/6;
dDn(j)=(gap2(j)+2*gap2(j-1)+2*gap2(j-2)+gap2(j-3))/6;
end

UP=sma(dUp,period);
DN=sma(dDn,period);

% calculate sma on UP and DOWN

%RVI=sma(dUp,period)./sma(dDn,period);
RVI=UP./DN;

RVIsig=sma(RVI,period);

T=length(Close);
S=zeros(T,1);
for i=1:T;
   if (RVI(i)>RVIsig(i))  S(i)=1;
   elseif(RVI(i)<RVIsig(i)) S(i)=-1;
   else S(i)=0;
   end
end
sssRVI=S;

end

