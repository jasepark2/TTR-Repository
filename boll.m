function out = boll(price,period,weight,sd)
% Function to calculate the aroon

%calculation

BOL= indicators(price,'boll',period,weight,sd);
middle =BOL(:,1);
upper  =BOL(:,2);
lower  =BOL(:,3);

T=length(price);
S=zeros(T,1);
for i=1:T;
   if     (price(i)> upper(i)) S(i)=-1;
   elseif (price(i) <lower(i)) S(i)=1;
   else S(i)=0;
end
S;
sssBOL=S;
end
out=sssBOL;
end