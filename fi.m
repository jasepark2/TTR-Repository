function [sigFI] = fi(Close,Volume,period);
% Function to calculate the force index

FI= indicators([Close,Volume],'force',period);

T=length(Close);
S=zeros(T,1);
for i=1:T;
   if (FI(i)< 0)  S(i)=-1;
   elseif(FI(i)> 0) S(i)=1;
   else S(i)=0;
end
S;
sigFI=S;
end
sigFI=S;
end
