function [sssLRI] = twoLRI(price,fast,slow)

LRI1 = lri(price,fast);
LRI2 = lri(price,slow);

T=length(price);
S=zeros(T,1);
for i=1:T;
    if     (LRI1(i)< LRI2(i)) S(i)=-1;
   elseif (LRI1(i)> LRI2(i)) S(i)= 1;
   else S(i)=0;
end
S;
sssLRI=S;
end
sssLRI; 
end

