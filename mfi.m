function [sigMFI] = mfi(High,Low,Close,Volume,period,upper)

%TP=Typical Price
TP = (High + Low + Close)/3;
%Raw Money Flow = Typical Price x Volume
RMF = TP.*Volume;

%Price Up or Down
n=length(TP);
UpDn=zeros(n,1);
for i=2:n
UpDn(1)=0;
   if(TP(i)>TP(i-1)) UpDn(i)=1;
   elseif (TP(i)<TP(i-1)) UpDn(i)=-1;
   else UpDn(i)= 0;
   end
end

%
PMF=zeros(1,n);
for i=2:n
   PMF(1)=0;
   if(UpDn(i)>0) PMF(i)=RMF(i);
   else PMF(i)= 0;
   end
end

NMF=zeros(1,n);
for i=2:n
   NMF(1)=0;
   if(UpDn(i)<0) NMF(i)=RMF(i);
   else NMF(i)= 0;
   end
end

%Money Flow Ratio = (14-period Positive Money Flow)/(14-period Negative Money Flow)
sumPMF=rollSUM(PMF,14);
sumNMF=rollSUM(NMF,14);
mr= sumPMF./sumNMF;
MFI= 100 - (100./(1 + mr));

T=length(High);
S=zeros(T,1);
for i=1:T;
   if (MFI(i)> upper)  S(i)=-1;
   elseif(MFI(i)< (100-upper)) S(i)=1;
   else S(i)=0;
   end
   sigMFI=S;
end
sigMFI;
end

