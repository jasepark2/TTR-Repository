function [sssKDJ] = kdj(High,Low,Close,k,d,upper)
% Function to calculate the KDJ
% K % D is from stochastic oscillator and J is addition one line derived
% using K, D line
% K = (Current Close - Lowest Low)/(Highest High - Lowest Low) * 100%
% D = 3-day SMA of K
% J = 3 * D - 2 * K 

kperiods=k;
dperiods=d;
hi = High;
lo = Low;
cl =Close;
observ=length(Close);
   
        % Fast %K
        fpctk = nan(observ,1);                      % preallocate Fast %K
        llv = zeros(observ,1);                      % preallocate lowest low
        llv(1:kperiods) = min(lo(1:kperiods));     % lowest low of first kperiods
        for i1 = kperiods:observ                    % cycle through rest of data
            llv(i1) = min(lo(i1-kperiods+1:i1));   % lowest low of previous kperiods
        end
        
        hhv = zeros(observ,1);                      % preallocate highest high
        hhv(1:kperiods) = max(hi(1:kperiods));    % highest high of first kperiods
        
        for i1 = kperiods:observ                    % cycle through rest of data
            hhv(i1) = max(hi(i1-kperiods+1:i1));  % highest high of previous kperiods
        end
        
        nzero        = find((hhv-llv) ~= 0); %find zero
        fpctk(nzero) = ((cl(nzero)-llv(nzero))./(hhv(nzero)-llv(nzero)))*100;
        
        % Fast %D
        fpctd                = nan(size(cl));
        fpctd(~isnan(fpctk)) = ema(fpctk(~isnan(fpctk)),dperiods);
        
        % Method # 1:
        jline = 3*fpctk-2*fpctd;
            
        KDJ = [fpctk,fpctd,jline];


% Input Data
              

KDJ(isnan(KDJ))=0;

K=KDJ(:,1);
D=KDJ(:,2);
J=KDJ(:,3);

TT=length(High);
S=zeros(TT,1);
for i=1:TT;
   if (J(i)>upper)  S(i)=1;
   elseif(J(i)<(100-upper)) S(i)=-1;
   else S(i)=0;
   end
end
sssKDJ=S;
end
