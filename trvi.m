function [SSS] = trvi(Open,High,Low,Close,Volume,RVI_period)
% Function to calculate Relative Vigor Index
% RVI = (Close – Open)/(High – Low)
% TRVI include Volume as TRUE source for the market movement. 
% calculate true RVI, sma of rawRVI

  if  RVI_period <=3
      error('RVI_period cannot be less than 4')
  end
    
  T=length(Close);
 
  MA=zeros(T,1); %weighted moving average
  for i=RVI_period:T
     MA(i,1)=Volume(i)*(Close(i)-Open(i))+8*Volume(i-1)*(Close(i-1)-Open(i-1))+8*Volume(i-2)*(Close(i-2)-Open(i-2))+Volume(i-3)*(Close(i-3)-Open(i-3));
  end
  
  RA=zeros(T,1); %weighted range average
  for i=RVI_period:T
     RA(i,1)=Volume(i)*(High(i)-Low(i))+ 8*Volume(i-1)*(High(i-1)-Low(i-1))+ 8*Volume(i-3)*(High(i-2)-Low(i-2))+Volume(i-3)*(High(i-3)-Low(i-3));
  end
  
  %
  RVI_Average = movsum(MA,RVI_period)./movsum(RA,RVI_period);
  RVI_Average(isnan(RVI_Average))=0;
  
  %
  sum_weight = (4+3+2+1); % sum of weight used
  RVIsignal=zeros(T,1);
  for i=RVI_period:T   
      RVIsignal(i,1) = (4*RVI_Average(i)+3*RVI_Average(i-1)+2*RVI_Average(i-2)+RVI_Average(i-3))./sum_weight;
  end

  for i=2:T 
      Trigger(i) = 0.9*(RVIsignal(i-1)+0.02);
  end

  SSS=zeros(T,1);
  for i=1:T;
     if (RVIsignal(i)< Trigger(i))
         S=-1;
     elseif (RVIsignal(i)> Trigger(i))
         S=1;
     else S=0;
     end
     SSS(i,1)=S;   
  end
   
end


