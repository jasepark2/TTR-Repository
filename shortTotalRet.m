function [totYield] = shortTotalRet(SSS,Return,TC,RF,LF)
% SSS is signals for all technical trading rules
% Return is daily unconditional returns, uRet 
% input: SS, R, T, TC, LF, DJ_Returns, RF
% output:	ReturnsOneStrat	(log returns), ReturnsOneStrat_SR (arith),
% RF_bis (arith)

[n nb_strats]=size(SSS);
totYield=zeros(n,nb_strats);
ReturnsOneStrat=zeros(n,1);

for s=1:nb_strats;
    SS=SSS(:,s);
    ReturnsOneStrat=zeros(n,1);
    S=0;
    for(t=1:n-1);
        oldS=S;
        S = SS(t);
        Yield = Return(t+1)*S; 
        	if(S~=oldS);
		    	if(S*oldS==-1);
				  Yield = Yield-2*TC;
                elseif(S*oldS==0);
				  Yield= Yield-TC;
                end
            end
            
            if(S==-1);
			Yield= Yield -LF;
            end   
                               
             if(S==0);
			Yield= Yield + RF(t+1);
            end   
            
            
     ReturnsOneStrat(t)= Yield;    
    end
 totYield(:,s)= ReturnsOneStrat;
end
totYield;

end

