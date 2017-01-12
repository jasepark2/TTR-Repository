function [out] = lowlow(low, period)
[r] =length(low);

for i=1:r-period+1
rawMIN(i)= min(low(i:i+period-1));
add = nan*ones(1,period-1);
llow=[add rawMIN];
end
out=llow;
end

