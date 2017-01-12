function [out] = highhigh(high, period)
[r] =length(high);

for i=1:r-period+1
rawMAX(i)= max(high(i:i+period-1));
add = nan*ones(1,period-1);
hhigh=[add rawMAX];
end
out=hhigh;
end

