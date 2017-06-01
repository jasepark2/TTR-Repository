function [SSS] = My_DJI_Signals_withSTW_24Sep2016(DATA,R)
%This is function from MyUSD_Param_Final_01July2013.m
%This is part of main function and this is to make singal (SSS) from each
%technical trading rule automatic.
%size of SSS is TT*Rules where TT is length of the one Rule.
% R is beginning date. If if the max length of parameter is 250, then R=251

Open   = DATA(:,1);
High   = DATA(:,2);
Low    = DATA(:,3);
Close  = DATA(:,4);
Volume  = DATA(:,5);

TT=length(High);
T=TT-1;
N=TT-R+1;

ma_b=[0,0.0005, 0.001, 0.002,0.005];
ma_nb=length(ma_b);
ma_d=[1,2,3,5,8,13];
ma_nd=length(ma_d);
ma_c=[2,3,5,8,13,21];
ma_nc=length(ma_c);

TT=length(High);
T=TT-1;
N=TT-R+1;


%%%%%%%%%%%    Part1 SECTION     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
%Settings
R=251;
TT= length(Close);       
T=TT-1;
N = T-R +1;
 
% Input parameters 
n1=[3,5,7,10,12,14,16,18,20,25,30,40];
n2=[5,10,14,20,25,30,40,70];
n3=[5,8,13,15,21,25,34,44,55];
n4=[5,10,15,20,40,70];
n5=[3,5,7,10,14,20,25,30,40,70,100];
n6=[2,4,6,8,10,12,14,16,18,20,22,24];
n7=[5,10,14,20,25,30,40,70,100];
n8=0.45:0.01:0.88;
n9 = [5,10,15,20,25,30,35,40,50];
n10 = [10,15,20,26,30,40,50,60,70];
n11 = [1,2,3];
n12 = [7,9,11,20];
n13=[5,10,14,20,24,30,40,70,80];
n14=[10,14,20,24,30,40,70,80];
n15=[9,10,11,12,13,14,15,16,17,18,19,20]; % min should be 9 
n16=[4,5,7,10,12,14,16,18,20,30,50,70];
n17=[3,5,10,14,20,24,30,40];
n18=[5,8,10,14,20,24,30,40,70];
n19=[5,10,14,20,24,30,40,70,100];
n20=[5,10,14,20,24,30,40,50,60,70,80,90,100,110,120,130,140,150];
n21=[5,10,15,20,25,30,35,40,50,60,70,80,90,100];
n22=[2,5,10,15,20,25,30,40,50,75,100,125,150,200,250];
n23 =[5,10,15,20,25,50,100,150,200,250];
n24 =[5,10,14,20,24,30,40,50,60,70,100];
 
index1=[0.5,0.618,0.75,0.786,1.236,1.382];
index2=[40,45,50,55,60];
index3=[6,8,10,12,14];
index4=[60,70,80,90];
index5=[70,75,80,85];
index6=[-15,-20,-25,-30];
index7=[3,5,7,9,14,20,24];
index8=[65,70,75,80,85];
index9=[5,7,9,14,20,24];
index10=[0.5,0.8,1.0,1.2,1.5,1.8,2.0];
 
b1=[0,0.0005,0.001,0.002,0.005];
b2=[0.001,0.005,0.01,0.015,0.02,0.03,0.04,0.05];
c1=[2,3,5,8,13,21];
c2=[1,5,10,25,50];
c3=[5,10,25,50];
d1=[1,2,3,5,8,13];
d2=[1,2,3,5,8];
d3=[5,10,25,50];
 
x1=[0.005,0.01,0.015,0.02,0.025,0.03,0.035,0.04,0.045,0.05,0.06,0.07,...
    0.08,0.09,0.1,0.12,0.14,0.16,0.18,0.2,0.25,0.3,0.4,0.5];
x2 = [0.005,0.01,0.02,0.03,0.05,0.075,0.10,0.15];
y=[0.005,0.01,0.015,0.02,0.025,0.03,0.04,0.05,0.075,0.1,0.15,0.2];
e1=[1,2,3,4,5,10,15,20];
e2=[2,3,4,5,10,20,25,50,100,200];
 
%Length of each parameters
nn1=length(n1);
nn2=length(n2);
nn3=length(n3);
nn4=length(n4);
nn5=length(n5);
nn6=length(n6);
nn7=length(n7);
nn8=length(n8);
nn9=length(n9);
nn10=length(n10);
nn11=length(n11);
nn12=length(n12);
nn13=length(n13);
nn14=length(n14);
nn15=length(n15);
nn16=length(n16);
nn17=length(n17);
nn18=length(n18);
nn19=length(n19);
nn20=length(n20);
nn21=length(n21);
nn22=length(n22);
nn23=length(n23);
nn24=length(n24);

nb1=length(b1);
nb2=length(b2);
nc1=length(c1);
nc2=length(c2);
nc3=length(c3);
nd1=length(d1);
nd2=length(d2);
nd3=length(d3);
nx1=length(x1);
nx2=length(x2);
ny=length(y);
ne1=length(e1);
ne2=length(e2);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART1 : non-STW Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% ADX, Average Directional Index %%%%%%%%%%
 
index=25;
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
     NNN(:,i) = adx(High,Low,Close,n1(i),index);
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1;
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1;
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totADX=horzcat(NNN,CCC,DDD);
 
%% Alligator Index %%%%%%%%%%
 
COMBI=combvec(n2,n2,n2)';
FIND=  COMBI(:,1)<COMBI(:,2) & COMBI(:,2)<COMBI(:,3);
comb=COMBI(FIND,:);
[s , ~]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i)= alligator(High,Low,comb(i,3),comb(i,2),comb(i,1));
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1;
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1;
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totAlligator=horzcat(NNN,CCC,DDD);
 
%% ARN, Aroon
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
  NNN(:,i) = aroon(High, Low, n1(i));
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totARN=horzcat(NNN,CCC,DDD);
 
%% ATR band, Average True Range
 
comb=combvec(n3,index1)';
[s , ~]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = atrBand(High,Low,Close,comb(i,1),comb(i,2));
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totATR=horzcat(NNN,CCC,DDD);
 
 %% Boll, Bollinger Index
 
weight=[0.618,1,1.382] ; % the higher the weight, the more weight for today
sd=[2,2.5,3];
comb=combvec(n4, weight, sd)';
[s, m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) =  boll(Close,COMBI(i,1),COMBI(i,2), COMBI(i,3));
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totBOLL=horzcat(NNN,CCC,DDD);
 
%% CCI,  % Commodity Channel Index
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
  NNN(:,i) = cci(High,Low, Close,n1(i),n1(i));
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totCCI=horzcat(NNN,CCC,DDD);
test=sum(sum(totCCI));
 
%% CGI,  % Center of Gravity Index
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn5;
  NNN(:,i) = cgi(Close,n5(i));
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn5;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn5;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totCGI=horzcat(NNN,CCC,DDD);
 
%% CMO,  % Chandle Momentum Oscillator
 
COMBI=combvec(n5,n5)';
FIND= find( COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = cmo(Close,COMBI(i,2), COMBI(i,1));
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totCMO=horzcat(NNN,CCC,DDD);
 
%% Coppock Curve
 
COMBI=combvec(n2,n2,n2)';
FIND=  COMBI(:,1)<COMBI(:,2) & COMBI(:,2)<COMBI(:,3);
comb=COMBI(FIND,:);
[s , ~]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
NNN(:,i) = coppock(Close,comb(i,2),comb(i,3),comb(i,1));
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totCOPP=horzcat(NNN,CCC,DDD);
 
%% Cyber Cycle Oscillator : http://www.mqlsoft.com/download/indicators
 
%additional inputs
for i=1:nn6
Alpha(i)=2/(n6(i)+1);
end
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn6;
  NNN(:,i) = cycle(High,Low,Alpha(i));
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn6;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn6;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totCyber=horzcat(NNN,CCC,DDD);
 
%% DEMA, Double EMA  
 
% oneMA with no logic
dema1=[];
for i=1:nn7
 dema0=demaRule(Close,n7(i));
 dema1(:,i) = TTR_SMA_B_ONE(T,dema0,Close,0);
end
 
% oneMA with b logic
dema2=[];
count=1;
for i=1:nn7
   for k=1:nb1
       dema2(:,count) = TTR_SMA_B_ONE(T,dema1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
dema3=[];
count=1;
mac_c=max(c1);
for i=1:nn7
   for k=1:nc1
       dema3(:,count) = TTR_SMA_C_ONE(R,T,dema1(:,i),Close,c1(k),max_c);
       count=count+1;
   end
end
 
DEMA1=[dema1,dema2,dema3];
 
% twoMA with no logic
COMBI=combvec(n7,n7)';
FIND=  COMBI(:,1)<COMBI(:,2);
comb=COMBI(FIND,:);
[s , ~]=size(comb);
 
for i=1:s
 nFast(:,i)=demaRule(Close,comb(i,1));
 nSlow(:,i)=demaRule(Close,comb(i,2));
end
 
dema4=[];
count=1;
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    dema4(:,i)=SSS;
end
 
%two ma with band(b)
dema5=[];
count=1;
for i=1:s
    for k=1:nb1
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k));
        dema5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
dema6=[];
count=1;
max_c=max(c1);
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c);
        dema6(:,count)=SSS;
        count=count+1;
        end
end
 
DEMA2=[dema4,dema5, dema6];
totDEMA=[DEMA1,DEMA2];
 
%% DeMarker  
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
NNN(:,i) = demarker(High, Low,n1(i));
end
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totDMK=horzcat(NNN,CCC,DDD);
 
%% DPO, Detrend Price Oscillator  
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
  NNN(:,i) = dpo(Close,n1(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totDPO=horzcat(NNN,CCC,DDD);
 
 
%% EMA 
 
%one MA with no logic
ma1=[];
for i=1:nn7
 ma0=ema(Close,n7(i)); %change
 ma1(:,i)=TTR_SMA_B_ONE(T,ma0,Close,0);
end
 
% oneMA with b logic
ma2=[];
count=1;
for i=1:nn7
   for k=1:nb1
       ma2(:,count) = TTR_SMA_B_ONE(T,ma1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
ma3=[];
count=1;
mac_c=max(c1);
for i=1:nn7
   for k=1:nc1
       ma3(:,count) = TTR_SMA_C_ONE(R,T,ma1(:,i),Close,c1(k),max_c);
       count=count+1;
   end
end
 
MA1=[ma1,ma2,ma3];
 
% twoMA with no logic
COMBI=combvec(n7,n7)';
FIND=  COMBI(:,1)<COMBI(:,2);
comb=COMBI(FIND,:);
[s m]=size(comb);
 
for i=1:s
 nFast(:,i)=ema(Close,comb(i,1)); %change
 nSlow(:,i)=ema(Close,comb(i,2)); %change
end
 
ma4=[];
count=1;
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    ma4(:,i)=SSS;
end
 
%two ma with band(b)
ma5=[];
count=1;
for i=1:s
    for k=1:nb1
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k));
        ma5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
ma6=[];
count=1;
max_c=max(c1);
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c);
        ma6(:,count)=SSS;
        count=count+1;
        end
end
 
MA2=[ma4,ma5,ma6];
totEMA=[MA1,MA2];
 
%% Ease of Movement
 
% NNN1 (for 'SMA'), original rules without logic 
NNN1=[];
for i=1:nn1;
  NNN1(:,i) =emv(High,Low,Volume,'SMA',n1(i),10000);
end
% n & c logic
max_c=max(c1);
CCC1=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC1(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN1(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD1=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD1(:,count) = TTR_Direct_DELAY(R,T,NNN1(:,i),d1(g));
    count=count+1;
    end
end 
 
% NNN2 (for 'WMA'), original rules without logic 
NNN2=[];
for i=1:nn1;
  NNN2(:,i) =emv(High,Low,Volume,'WMA',n1(i),10000);
end
NNN=[NNN1,NNN2];
 
% n & c logic
max_c=max(c1);
CCC2=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC2(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN2(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD2=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD2(:,count) = TTR_Direct_DELAY(R,T,NNN2(:,i),d1(g));
    count=count+1;
    end
end
 
totEMV=[NNN1, NNN2,CCC1,CCC2,DDD1,DDD2];
 
%% Entropy
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
  NNN(:,i) = entropy(Close,n1(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totEntropy=horzcat(NNN,CCC,DDD);
 
%% ERI, Elder Ray Indicator
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
  NNN(:,i) = eri(High,Low,Close,n1(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totERI=horzcat(NNN,CCC,DDD);
 
%% Force Index, FI
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn1;
  NNN(:,i) = fi(Close,Volume,n1(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn1;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn1;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totFI=horzcat(NNN,CCC,DDD);
 
%% Kelt, Keltner Channels Index
 
COMBI=combvec(n5,n5)';
FIND= COMBI(:,1)<COMBI(:,2);
comb=COMBI(FIND,:)';
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
  NNN(:,i) = keltner(High,Low,Close,comb(2,i),2,comb(1,i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totKelt=horzcat(NNN,CCC,DDD);
 
%% LRI, Linear Regression Index
 
COMBI=combvec(n5,n5)';
FIND=find(COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:)';
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
  NNN(:,i) =twoLRI(Close,COMBI(i,1),COMBI(i,2));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totLRI=horzcat(NNN,CCC,DDD);
 
%% LRSI, Laguerre RSI
 
gamma=[0.45:0.01:0.88];
m=length(gamma);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
  NNN(:,i) = lrsi(Close,gamma(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totLRSI=horzcat(NNN,CCC,DDD);
 
%% MACD, Moving Average Convergence and Divergence
 
COMBI=combvec(n2,n2,n2)';
FIND= COMBI(:,1)<COMBI(:,2) & COMBI(:,2)<COMBI(:,3);
comb=COMBI(FIND,:)';
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
  NNN(:,i) = macd(Close,comb(2,i),comb(3,i),comb(1,i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totMACD=horzcat(NNN,CCC,DDD);
 
%% MACD4, Moving Average COnvergence and Divergence 4
 
COMB1=combvec(n9,n10,n11,n12)';
FIND=find(COMB1(:,1)< COMB1(:,2));
comb=COMB1(FIND,:);
[s m]=size(comb);
 
sssMACD4=[];
for i=1:s;
sssMACD4(:,i)=macd4(Close,comb(i,1),comb(i,2),comb(i,3),comb(i,4));
sigMACD4=sssMACD4(R:TT,:);
end
 
totMACD4=sssMACD4;
 
%% MFI, Money Flow Index, RRRRRRRRR!!!!!!!!!!!!
 
comb=combvec(n13,index4);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
  NNN(:,i) = mfi(High,Low,Close,Volume,comb(1,i),comb(2,i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totMFI=horzcat(NNN,CCC,DDD);
 
%% PEMA, Pentuple EMA  
 
%one MA with no logic
ma1=[];
for i=1:nn14 %change1
 ma0=pema(Close,n14(i)); %change2
 ma1(:,i)=TTR_SMA_B_ONE(T,ma0,Close,0);
end
 
% oneMA with b logic
ma2=[];
count=1;
for i=1:nn14 %change3
   for k=1:nb1 %change4
       ma2(:,count) = TTR_SMA_B_ONE(T,ma1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
ma3=[];
count=1;
mac_c=max(c1); %change5
for i=1:nn14 %change6
   for k=1:nc1 %change7
       ma3(:,count) = TTR_SMA_C_ONE(R,T,ma1(:,i),Close,c1(k),max_c);%change8
       count=count+1;
   end
end
 
MA1=[ma1,ma2,ma3];
 
% twoMA with no logic
COMBI=combvec(n14,n14)'; %change9
FIND= find( COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:);
[s m]=size(comb);
 
for i=1:s
 nFast(:,i)=pema(Close,comb(i,1)); %change10
 nSlow(:,i)=pema(Close,comb(i,2)); %change10
end
 
ma4=[];
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    ma4(:,i)=SSS;
end
 
%two ma with band(b)
ma5=[];
count=1;
for i=1:s
    for k=1:nb1 %change12
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k)); %change13
        ma5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
ma6=[];
count=1;
max_c=max(c1); %change14
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c); %change15
        ma6(:,count)=SSS;
        count=count+1;
        end
end
 
MA2=[ma4,ma5,ma6];
totPEMA=[MA1,MA2];
 
%% PMO, Price Momemtum oscillator
 
COMBI=combvec(n19,n19,index9)';
comb= COMBI(COMBI(:,1)>COMBI(:,2),:);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = pmo(Close,comb(i,1),comb(i,2),comb(i,3));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn19;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn19;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totPMO=horzcat(NNN,CCC,DDD);
 
%% PPO, percent Price oscillator
 
COMBI=combvec(n19,n19,index7)';
comb= COMBI(COMBI(:,1)>COMBI(:,2),:);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = ppo(Close,comb(i,1),comb(i,2),comb(i,3));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn19;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn19;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totPPO=horzcat(NNN,CCC,DDD);
 
%% QEMA, Quadruple EMA
 
%one MA with no logic
ma1=[];
for i=1:nn14 %change1
 ma0=qema(Close,n14(i)); %change2
 ma1(:,i)=TTR_SMA_B_ONE(T,ma0,Close,0);
end
 
% oneMA with b logic
ma2=[];
count=1;
for i=1:nn14 %change3
   for k=1:nb1 %change4
       ma2(:,count) = TTR_SMA_B_ONE(T,ma1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
ma3=[];
count=1;
mac_c=max(c1); %change5
for i=1:nn14 %change6
   for k=1:nc1 %change7
       ma3(:,count) = TTR_SMA_C_ONE(R,T,ma1(:,i),Close,c1(k),max_c);%change8
       count=count+1;
   end
end
 
MA1=[ma1,ma2,ma3];
 
% twoMA with no logic
COMBI=combvec(n14,n14)'; %change9
FIND=  COMBI(:,1)<COMBI(:,2);
comb=COMBI(FIND,:);
[s ~]=size(comb);
 
for i=1:s
 nFast(:,i)=qema(Close,comb(i,1)); %change10
 nSlow(:,i)=qema(Close,comb(i,2)); %change10
end
 
ma4=[];
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    ma4(:,i)=SSS;
end
 
%two ma with band(b)
ma5=[];
count=1;
for i=1:s
    for k=1:nb1 %change12
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k)); %change13
        ma5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
ma6=[];
count=1;
max_c=max(c1); %change14
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c); %change15
        ma6(:,count)=SSS;
        count=count+1;
        end
end
 
MA2=[ma4,ma5,ma6];
totQEMA=[MA1,MA2];
 
%% DeMark's Range Expansion Index, REI 
 
comb=combvec(n15,index2);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
  NNN(:,i) = rei(High,Low,Close,comb(1,i),comb(2,i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totREI=horzcat(NNN,CCC,DDD);
 
%% ROC, Rate of Change
 
comb=combvec(n13,index3);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m
NNN(:,i)= roc(Close,comb(1,i),comb(2,i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totROC=horzcat(NNN,CCC,DDD);
 
%% RSI, Relative Strength Index
 
comb=combvec(n24,index4);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:m;
NNN(:,i)= rsi(Close,comb(1,i),comb(2,i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:m;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totRSI=horzcat(NNN,CCC,DDD);
 
%% RVI, Relative Vigor Index  
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn16;
  NNN(:,i) = rvi(Open,High,Low,Close,n16(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn16;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn16;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totRVI=horzcat(NNN,CCC,DDD);
 
%% SCYC, Stochastic Cyber Cycle
Alpha=zeros(1,nn16);
for i=1:nn16
Alpha(i)=2/(n16(i)+1);
end
 
% NNN, original rules without logic 
NNN=zeros(TT,nn16);
for i=1:nn16;
  NNN(:,i) = scyc(High,Low,Alpha(i),n16(i), 4, 75);
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn16;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn16;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totSCYC=horzcat(NNN,CCC,DDD);
 
%% StocCGI, Stochastic Center of Gravity
 
COMBI=combvec(n18,n18)';
FIND= COMBI(:,1)>=COMBI(:,2);
comb=COMBI(FIND,:);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
NNN(:,i)= stocCGI(Close,comb(i,1),comb(i,2),80);
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totStocCGI=horzcat(NNN,CCC,DDD);
 
%% Stochastic KDJ,one more parameter for Stochastic,  K,D & J
 
COMBI=combvec(n19,index7,index8)';
FIND=find(COMBI(:,1)>COMBI(:,2));
comb=COMBI(FIND,:);
[s , ~]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = kdj(High,Low,Close,comb(i,1),comb(i,2),comb(i,3));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn19;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn19;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totSKDJ=[NNN,CCC,DDD];
 
%% SONAR
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn16;
  NNN(:,i) = sonar(Close,n16(i));
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:nn16;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn16;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totSONAR=horzcat(NNN,CCC,DDD);
 
%% STRSI, Stochastic RSI
 
comb=combvec(n13,index4)';
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s
NNN(:,i)= stocRSI(Close,comb(i,1),4, comb(i,2));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totStocRSI=horzcat(NNN,CCC,DDD);
 
%% STRVI, Stochastic Relative Vigor Index
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn16;
  NNN(:,i) = stocRVI(Open,High,Low,Close,n16(i),4,80);
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn16;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn16;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totStocRVI=horzcat(NNN,CCC,DDD);
 
%% SSMA 
 
%one MA with no logic
ma1=[];
for i=1:nn14 %change1
 ma0=smma(High,Low,n14(i)); %change2
 ma1(:,i)=TTR_SMA_B_ONE(T,ma0',Close,0);
end
 
% oneMA with b logic
ma2=[];
count=1;
for i=1:nn14 %change3
   for k=1:nb1 %change4
       ma2(:,count) = TTR_SMA_B_ONE(T,ma1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
ma3=[];
count=1;
mac_c=max(c1); %change5
for i=1:nn14 %change6
   for k=1:nc1 %change7
       ma3(:,count) = TTR_SMA_C_ONE(R,T,ma1(:,i),Close,c1(k),max_c);%change8
       count=count+1;
   end
end
 
MA1=[ma1,ma2,ma3];
 
% twoMA with no logic
COMBI=combvec(n14,n14)'; %change9
FIND=  COMBI(:,1)<COMBI(:,2);
comb=COMBI(FIND,:);
[s m]=size(comb);
 
for i=1:s
 nFast(:,i)=smma(High,Low,comb(i,1)); %change10
 nSlow(:,i)=smma(High,Low,comb(i,2)); %change10
end
 
ma4=[];
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    ma4(:,i)=SSS;
end
 
%two ma with band(b)
ma5=[];
count=1;
for i=1:s
    for k=1:nb1 %change12
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k)); %change13
        ma5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
ma6=[];
count=1;
max_c=max(c1); %change14
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c); %change15
        ma6(:,count)=SSS;
        count=count+1;
        end
end
 
MA2=[ma4,ma5,ma6];
totSMMA=[MA1,MA2];
 
%% STO, fast and slow Stochastic
 
upper=[70,80];
COMBI=combvec(n17,n17,upper)';
FIND=find(COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s
NNN(:,i)= ssto(High,Low,Close,comb(i,2),comb(i,1));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totSTO=horzcat(NNN,CCC,DDD);
 
%% TEMA, Triple EMA  
 
%one MA with no logic
ma1=[];
for i=1:nn14 %change1
 ma0=tema(Close,n14(i)); %change2
 ma1(:,i)=TTR_SMA_B_ONE(T,ma0,Close,0);
end
 
% oneMA with b logic
ma2=[];
count=1;
for i=1:nn14 %change3
   for k=1:nb1 %change4
       ma2(:,count) = TTR_SMA_B_ONE(T,ma1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
ma3=[];
count=1;
mac_c=max(c1); %change5
for i=1:nn14 %change6
   for k=1:nc1 %change7
       ma3(:,count) = TTR_SMA_C_ONE(R,T,ma1(:,i),Close,c1(k),max_c);%change8
       count=count+1;
   end
end
 
MA1=[ma1,ma2,ma3];
 
% twoMA with no logic
COMBI=combvec(n14,n14)'; %change9
FIND= find( COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:);
[s m]=size(comb);
 
for i=1:s
 nFast(:,i)=tema(Close,comb(i,1)); %change10
 nSlow(:,i)=tema(Close,comb(i,2)); %change10
end
 
ma4=[];
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    ma4(:,i)=SSS;
end
 
%two ma with band(b)
ma5=[];
count=1;
for i=1:s
    for k=1:nb1 %change12
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k)); %change13
        ma5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
ma6=[];
count=1;
max_c=max(c1); %change14
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c); %change15
        ma6(:,count)=SSS;
        count=count+1;
        end
end
 
MA2=[ma4,ma5,ma6];
totTEMA=[MA1,MA2];
 
%% TRIX
 
COMBI=combvec(n24,index4)'; %change9
FIND= find( COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:);
[s m]=size(comb);
 
% NNN, original rules without logic 
TRX1=[];
for i=1:s
TRX1(:,i)= trix(Close,comb(i,2),'SMA',comb(i,1));
end
 
TRX2=[];
for i=1:s
TRX2(:,i)= trix(Close,comb(i,2),'WMA',comb(i,1));
end
 
TRX3=[];
for i=1:s
TRX3(:,i)= trix(Close,comb(i,2),'EMA',comb(i,1));
end
 
NNN=[TRX1,TRX2,TRX3];
[s m]=size(NNN);
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:m;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
 
totTRIX=[NNN,CCC];
 
%% True RVI
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn16;
  NNN(:,i) = trvi(Open,High,Low,Close,Volume,n16(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn16;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn16;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totTRVI=horzcat(NNN,CCC,DDD);
 
%% TSI, True Strength Index
 
comb=combvec(n19,index4)'; %70 on n19 is period and that of index4 is 
                           %selling level 70%. No identical....                           %  
[s , ~]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s
NNN(:,i)= tsi(Close,comb(i,1),comb(i,2));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totTSI=[NNN,CCC,DDD];
 
%% Ultimate Oscillator
 
COMB1=combvec(n14,n14,n14)';
FIND= find(COMB1(:,1)<COMB1(:,2) & COMB1(:,2)<COMB1(:,3));
comb=COMB1(FIND,:);
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
NNN(:,i)= ultimate(High,Low,Close,comb(i,1),comb(i,2),comb(i,3),4,2,1);
end
 
% n & c logic
max_c=max(c1);
Default=NNN;
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totUO= [NNN,CCC,DDD];
 
%% Vertex Index  
 
% NNN, original rules without logic 
NNN=[];
for i=1:nn20;
NNN(:,i) = vortex(High,Low,Close,n20(i));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn20;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
 
% n & d logic
DDD=[];
count=1;
for i=1:nn20;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
totVorTEX=horzcat(NNN,CCC,DDD);
 
%% Volatility Ratio,VR
 
comb=combvec(n21,index10)';
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = vr(High,Low,Close,comb(i,1),comb(i,2));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:nn21;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:nn21;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totVR=horzcat(NNN,CCC,DDD);
 
%% Wilder MA 
 
%one MA with no logic
ma1=[];
for i=1:nn14 %change1
 ma0=wildersmoothing(Close,n14(i)); %change2
 ma1(:,i)=TTR_SMA_B_ONE(T,ma0,Close,0);
end
 
% oneMA with b logic
ma2=[];
count=1;
for i=1:nn14 %change3
   for k=1:nb1 %change4
       ma2(:,count) = TTR_SMA_B_ONE(T,ma1(:,i),Close,b1(k));
       count=count+1;
   end
end
 
% oneMA with c logic
ma3=[];
count=1;
mac_c=max(c1); %change5
for i=1:nn14 %change6
   for k=1:nc1 %change7
       ma3(:,count) = TTR_SMA_C_ONE(R,T,ma1(:,i),Close,c1(k),max_c);%change8
       count=count+1;
   end
end
 
MA1=[ma1,ma2,ma3];
 
% twoMA with no logic
COMBI=combvec(n14,n14)'; %change9
FIND= find( COMBI(:,1)<COMBI(:,2));
comb=COMBI(FIND,:);
[s, m]=size(comb);
 
for i=1:s
 nFast(:,i)=wildersmoothing(Close,comb(i,1)); %change10
 nSlow(:,i)=wildersmoothing(Close,comb(i,2)); %change10
end
 
ma4=[];
for i=1:s
    SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),0);
    ma4(:,i)=SSS;
end
 
%two ma with band(b)
ma5=[];
count=1;
for i=1:s
    for k=1:nb1 %change12
        SSS = TTR_SMA0_TWO(T,nFast(:,i),nSlow(:,i),b1(k)); %change13
        ma5(:,count)=SSS;
        count=count+1;
    end
end
 
% two ma with constant holding(c)
ma6=[];
count=1;
max_c=max(c1); %change14
for i=1:s
    for g=1:nc1
        SSS = TTR_SMA1_TWO(R,T,nFast(:,i),nSlow(:,i),0,c1(g),max_c); %change15
        ma6(:,count)=SSS;
        count=count+1;
        end
end
 
MA2=[ma4,ma5,ma6];
totWDMA=[MA1,MA2];
 
%% WPR, William Percent R
 
comb=combvec(n5,index6)';
[s m]=size(comb);
 
% NNN, original rules without logic 
NNN=[];
for i=1:s;
  NNN(:,i) = wpr(High, Low, Close,comb(i,1),comb(i,2));
end
 
% n & c logic
max_c=max(c1);
CCC=[];
count=1;
for i=1:s;
    for k=1:nc1
    CCC(:,count) = TTR_Direct_HOLD(R,T,c1(k),NNN(:,i),max_c);
    count=count+1;
    end
end
% n & d logic
DDD=[];
count=1;
for i=1:s;
    for g=1:nd1
    DDD(:,count) = TTR_Direct_DELAY(R,T,NNN(:,i),d1(g));
    count=count+1;
    end
end
 
totWPR=[NNN,CCC,DDD];
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% STW Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% Filter Rules
nx=24;
x=[0.005,0.01,0.015,0.02,0.025,0.03,0.035,0.04,0.045,0.05,0.06,0.07,0.08,0.09,0.1,0.12,0.14,0.16,0.18,0.2,0.25,0.3,0.4,0.5];
ny=12;
y=[0.005, 0.01, 0.015, 0.02, 0.025, 0.03, 0.04, 0.05, 0.075,    0.1, 0.15, 0.2];
%for alternative def of extrema:
ne=8;
e=[1, 2, 3, 4, 5, 10, 15, 20];
%constant holding period
nc=4;
c=[5, 10, 25, 50];
 
%Filter rule 1: first def of subsequent high/low
count=1;
AFR1=[];
for(i=1:nx)
    S=0;
    pt_extrema=R;
    for(t=R:T)
      [S]=afr1(S, t, pt_extrema,x(i),Close);
        AFR1(t,count)=S;
    end
     count=count+1;
end
 
%Filter rule 2:alternative def of subsequent high/low, no neutral position
count=1;
for i=1:nx 
    for j=1:ne
        S=0;
        pt_extrema=R-1;
        for t=R:T 
            S=afr2(S, t, pt_extrema, x(i),e(j),Close);
            AFR2(t,count)=S;
        end
        count=count+1;
    end
end
 
%Filter rule 3: constant holding period, first def of subsequent high/low
count=1;
for(i=1:nx) 
    for(j=1:nc)
        pt_extrema=R-1;
        pt_holding=R-c(nc-1)-10;
        for(t=R:T)
            S=afr3(S,t,pt_extrema,pt_holding,x(i),c(j),Close);
            AFR3(t,count)=S;
        end
        count=count+1;
    end
end
 
%Filter rule 4: y as sequent high/low,neutral position
count=1;
for(i=1:nx)
    for(j=1:ny)
        if(y(j)<x(i))
            S=0;
            t_extrema=R-1;
            for(t=R:T)
                S=afr4(S,t,t_extrema,x(i),y,Close);
                AFR4(t,count)=S;
            end
            count=count+1;                
        end
    end
end
Filter=[AFR1,AFR2,AFR3,AFR4];
 
%% Channel Breakout Rules
 
% input parameters*/
n=[5,10,15,20,25,50,100,150,200,250];
nn=length(n);
%diff between high and low for the channel:
x=[0.005, 0.01, 0.02, 0.03, 0.05, 0.075, 0.1, 0.15];
nx=length(x);
%percentage band:
b=[0,0.001, 0.005, 0.01, 0.015, 0.02, 0.03, 0.04, 0.05];
nb=length(b);
%constant holding period:t
c=[5,10,25,50];
nc=length(c);
   
%loop
count=1;
S=0;
CBO=[];
pt_holding=R-c(nc)-10;
for i=1:nn
   for j=1:nx
       for k=1:nc
           for l=1:nb
               if b(l)<x(j)
                   S=0;
                   for t=R:T
                       [S]=cbo(S,t,pt_holding,n(i),x(j),c(k),b(l),Close);
                       CBO(t,count)=S;
                   end
                   count=count+1;
               end
           end
       end
   end
end
 
%% Support & Resistance Rule
 
%/* input parameters*/
%nb of days for the extremum:
n=[5,10,15,20,25,50,100,150,200,250];
nn=length(n);
%for alternative def of extrema:
e=[2,3,4,5,10,20,25,50,100,200];
ne=length(e);
%percentage band:
b=[0,0.001,0.005,0.01,0.015,0.02,0.03,0.04,0.05];
nb=length(b);
%time delay filter:
d=[2,3,4,5];
nd=length(d);
%constant holding period:
c=[1,5,10,25,50];
nc=length(c);
 
% SAR1, n,b,c 
 count=1;
 SAR1a=[];
 for i=1:nn
     for j=1:nb
         for k=1:nc
             S=0;
             pt_holding=R-c(nc)-10;
             for(t=R:T)
                S=sar1a(S,t,pt_holding,n(i),b(j),c(k),Close);
                SAR1a(t,count)=S;
             end
             count=count+1;
         end
     end
 end
 
 % SAR1b,n,c,d 
 count=1;
 SAR1b=[];
 for i=1:nn
     for k=2:nc
         for j=1:nd
             S=0;
             pt_holding=R-c(nc)-10;
             for(t=R:T)
                S=sar1b(S,t,pt_holding,n(i),c(k),d(j),Close);
                SAR1b(t,count)=S;
             end
             count=count+1;
         end
     end
 end
 
 %SAR3 extrema, e,b,c
 count=1;
 SAR2a=[];
 oldS=0;
 for i=1:ne
     for k=1:nc
         for j=1:nb % no b and b, 2:nb means only case of b
             S=0;
             pt_holding=R-c(nc)-10;
             pt_e=R-2;
             for(t=R:T)
                 [S] = sar2a(oldS,t,pt_holding,pt_e,e(i),b(j),c(k),Close);
                 SAR2a(t,count)=S;
             end
             count=count+1;
         end
     end
 end
 
%SAR2b,e,d,c :
%alternative def of extrema, constant holding period, time delay filter
  count=1;
  SAR2b=[];
 for(i=1:ne) 
     for(j=1:nd) 
        for(k=2:nc) % only assumed holdings
            pt_e=R-2;
            for(t=R:T) 
                if(t>=(R+ d(j)))
                    S=sar2b(S, t, pt_e, pt_holding,e(i),d(j),c(k),Close);
                else
                    S=0;
                end
                SAR2b(t,count)=S;
            end
                count=count+1;
        end
    end
 end
SAR=[SAR1a, SAR1b, SAR2a, SAR2b];
 
%% Moving Average Rules
 
% periods
n=[1,2,5,10,15,20,25,30,40,50,75,100,125,150,200,250]; % 1 mwans pure n
nn=length(n);
%percentage band:
b=[0,0.001,0.005,0.01,0.015,0.02,0.03,0.04,0.05]; % 0 for no 
nb=length(b);
%time delay:
d=[2,3,4,5];
nd=length(d);
%constant holding period:
c=[5,10,25,50];
nc=length(c);
% 9 additional BLL rules:
nf=[1,2,5];
nnf=length(nf);
ns=[50,150,200];
nns=length(ns);
 
% Moving average 1, two MAs, constant holding period, percentage band filter:
count=1;
SMA1=[];
for i=2:nn %slow
    for j=1:i %fast
 %n,m,c =(15+105)*4 = 480
        if i>j
            for k=1:nc;
                S=0;
                pt_holding=R-c(nc-1)-10;
                for t=R:T
                   S=sma1(S,t,pt_holding,n(i),n(j),c(k),0,Close);
                   SMA1(t,count)=S;
                end
                 count=count+1;
            end
        else
             continue
        end
 
    end
end
 
% Moving average 2, two MAs, percentage band filter:
count=1;
SMA2=[];
 
for i=2:nn %slow
    for j=1:i %fast
        if i>j
           for k=1:nb
               %n,m,b=(15+105)*8 =960    
               S=0;
               pt_holding=R-c(nc-1)-10;
               for t=R:T
                   S=sma1(S,t,pt_holding,n(i),n(j),1,b(k),Close);
                   SMA2(t,count)=S;
               end
               count=count+1;
           end
        else
            continue
        end
    end
end
 
% Moving average 3: two MAs, time delay
count=1;
SMA3=[];
for i=2:nn % //slow
    for j=1:i % //fast
        if i>j
            for k=1:nd; 
                for t=R:T;
                    if(t>=(R+d(k)-1))
                       S=sma2(t,n(i),n(j),d(k),Close);
                    else
                       S=0;
                    end
                    SMA3(t,count)=S;
                end    
                count=count+1;
            end
        else
            continue
        end
    end
end
        
% Moving average4, 9 additional rules:
count=1;
SMA4=[];
c=10;
b=0.01;
S=0;
for(i=1:nns)
    for(j=1:nnf)
        pt_holding=R-c-10;
        for(t=R:T)
            S=sma1(S,t,pt_holding,ns(i),nf(j),c,b,Close);
            SMA4(t,count)=S;
        end
        count=count+1;
    end
end
SMA=[SMA1,SMA2,SMA3,SMA4];
 
%% On Balance Volume
 
% periods
n=[1,2,5,10,15,20,25,30,40,50,75,100,125,150,200,250]; % 1 mwans pure n
nn=length(n);
%percentage band:
b=[0,0.001,0.005,0.01,0.015,0.02,0.03,0.04,0.05]; % 0 for no 
nb=length(b);
%time delay:
d=[2,3,4,5];
nd=length(d);
%constant holding period:
c=[5,10,25,50];
nc=length(c);
 
% OBV1, two MAs, constant holding period, percentage band filter:
count=1;
OBV1=[];
 
for i=2:nn %slow
    for j=1:i %fast
 %n,m,c =(15+105)*4 = 480
        if i>j
            for k=1:nc
                S=0;
                pt_holding=R-c(nc-1)-10;
                for t=R:T
                   S=sma1(S,t,pt_holding,n(i),n(j),c(k),0,Volume);
                   OBV1(t,count)=S;
                end
                 count=count+1;
            end
        else
             continue
        end
 
    end
end
 
% OBV2, two MAs, percentage band filter:
count=1;
OBV2=[];
 
for i=2:nn %slow
    for j=1:i %fast
        if i>j
           for k=1:nb
               %n,m,b=(15+105)*8 =960    
               S=0;
               pt_holding=R-c(nc-1)-10;
               for t=R:T
                   S=sma1(S,t,pt_holding,n(i),n(j),1,b(k),Volume);
                   OBV2(t,count)=S;
               end
               count=count+1;
           end
        else
            continue
        end
    end
end
 
% OBV3: two MAs, time delay
count=1;
OBV3=[];
for i=2:nn % //slow
    for j=1:i % //fast
        if i>j
            for k=1:nd; 
                for t=R:T;
                    if(t>=(R+d(k)-1))
                       S=sma2(t,n(i),n(j),d(k),Volume);
                    else
                       S=0;
                    end
                    OBV3(t,count)=S;
                end    
                count=count+1;
            end
        else
            continue
        end
    end
end
OBV=[OBV1,OBV2,OBV3];
 
STW=[Filter, CBO, SAR,SMA,OBV];
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART3 : Return Generation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% Total Rules
 
%nonSTW
pSSS1= [totADX,totAlligator,totARN,totATR,totBOLL,totCCI,totCGI,totCMO,totCOPP,totCyber,totDEMA];
pSSS2= [totDMK,totDPO,totEMA,totEMV,totEntropy,totERI,totFI,totKelt,totLRI,totLRSI];
pSSS3= [totMACD,totMACD4,totMFI, totPEMA,totQEMA,totREI,totROC,totRSI,totRVI,totSMMA,totSONAR];
pSSS4= [totSTO,totSCYC,totStocCGI,totStocRSI,totStocRVI,totTEMA,totTRIX,totTRVI,totTSI,totUO,totWDMA,totWPR];
pSSS5= [totSKDJ,totPMO,totPPO,totVorTEX,totVR];
nonSTW=[pSSS1,pSSS2,pSSS3,pSSS4,pSSS5];
nonSTW=nonSTW(1:T,:);
%Total Rules
SSS =[nonSTW, STW]; %total matrix of Signals
[m1]=size(nonSTW,2); % nonSTW Rules (m1=21014)
[m2]=size(STW,2) ;   % STW Rules (m2=7846)
[m3]=size(SSS,2)    % total Rules (m3=28860) 


end










