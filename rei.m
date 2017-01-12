function [sREI]= rei(High,Low,Close,period,index)
% DeMarker's REI
% R is first data series number,  R=251

[n m] = size(High);
TT=length(High);

for i=period+1:TT;
diff1 = High(i) - High(i - 2);
   diff2 = Low(i) - Low(i - 2);

   if ((High(i - 2) < Close(i - 7)) && (High(i - 2) < Close(i - 8)) && (High(i) < High(i - 5)) && (High(i) < High(i-6)));
      num_zero1 = 0;
   else
      num_zero1 = 1;
   end
   
   if ((Low(i - 2) > Close(i - 7)) && (Low(i - 2) > Close(i - 8)) && (Low(i) > Low(i - 5)) && (Low(i) > Low(i - 6)));
      num_zero2 = 0;
   else
      num_zero2 = 1;
   end
 SubValue(i)=(num_zero1 * num_zero2 * (diff1 + diff2));  
end
sumSV = filter(ones(1,period),1,SubValue);

for i=period+1:TT
   diff1 = abs(High(i) - High(i - 2));
   diff2 = abs(Low(i) - Low(i - 2));
   AbsValue(i) =(diff1 + diff2);
end
sumAV = filter(ones(1,period),1,AbsValue);

for i=period+1:TT
REI(i)=(sumSV(i)/sumAV(i))*100; 
end

T=length(REI);
S=zeros(T,1);
for i=1:T;
   if REI(i)> index S(i)=-1;
   elseif REI(i)<-index S(i)=1;
   else S(i)=0;
end
S;
sREI=S;
end
sREI;
end
    
    
