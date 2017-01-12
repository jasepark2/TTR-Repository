function [sssLRSI] = lrsi(price,gamma)
% Function to calculate the Laguerre RSI.
% 'data' is the vector to operate on.  The first element is assumed to be
% the oldest data.
% 'period' is the number of periods over which to calculate the indicator
%
% Example:
%lrsi(price,gamma)

% calculate LRSI

R=251;
TT=length(price);
T=TT-1;
N=TT-R+1;

L0(1)=0;
L1(1)=0;
L2(1)=0;
L3(1)=0;

%to claculate Laguerre Filter
t=length(price);
LRSI=zeros(t,1);

for i=2:t
L0(i) = (1 - gamma)*price(i) + gamma*L0(i-1);
L1(i) = - gamma *L0(i) + L0(i-1) + gamma *L1(i-1);
L2(i) = - gamma *L1(i) + L1(i-1) + gamma *L2(i-1);
L3(i) = - gamma *L2(i) + L2(i-1) + gamma *L3(i-1);

%to calculate RSI
CU = 0;
CD = 0;

  if(L0(i) >= L1(i)) 
    CU = L0(i) - L1(i); 
  else 
    CD = L1(i) - L0(i);
  end
        
  if(L1(i) >= L2(i)) 
            CU = CU + L1(i) - L2(i); 
        else 
            CD = CD + L2(i) - L1(i);
  end
        
 if(L2(i) >= L3(i)) 
            CU = CU + L2(i) - L3(i); 
        else 
            CD = CD + L3(i) - L2(i);
 end
        
if((CU + CD) ~= 0) 
      lrsi(i) = CU / (CU + CD);
      LRSI(i) = lrsi(i);
end
end

T=length(price);
S=zeros(T,1);

upper=0.85;
lower=0.15;

for i=1:T;
    if    (LRSI(i)> upper) S(i)=-1;
   elseif (LRSI(i)> lower) S(i)= 1;
   else S(i)=0;
    end
end
sssLRSI=[S];



