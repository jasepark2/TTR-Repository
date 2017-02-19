
clear all

%=========================================================================%
%~~~~~~~~~~~~~~Part 1: Before Loop Inputs~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%=========================================================================%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Common Inputs (Only Change Area)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%~~~~~~~~~~~~~~~~FIles and Folders Locations ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
functionPath='C:\Test'


% Transactio costs

TC=[0,0.0005];% {0,5,10,15,20bps}
SBC= [0,0.001];% Stock borrowing costs (0.002, 0.001, 0)

%=========================================================================%
%~~~~~~~~~~~~~~Part 2: Generate Investment Returns~~~~~~~~~~~~~~~~~~~~~~~~%
%=========================================================================%

cd(functionPath)
 
 for g=1:length(SBC) % 
    
%~~~~~~~~~~~~~~ Load Signals from New Indicators ~~~~~~~~~~~~~~~~~~~~~~~~~~


SSS=load('SSS.mat');
SSS=struct2cell(SSS);
SSS=cell2mat(SSS);
SSS(isnan(SSS))=0;

TT=size(SSS,1);
T=TT-1; % length for returns
R=1;
N=TT-R;

%~~~~~~~~~~~~~~ load price and deposit data   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DATA=xlsread('sampleDJIA');


Close=DATA(:,4); % change !!
volume=DATA(:,5);
deposit=DATA(:,6);
Depo= log(1+deposit./100)/251; % Daily interest charge

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate Buy & Hold Return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Buy & Hold (BNH)

BNH=zeros(TT,1);
for(t=2:TT); % returnd start from second day..
BNH(1)=0;
BNH(t) = log(Close(t)/Close(t-1));
end

save('BNH.mat', 'BNH');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculation of Conditional Returns based on Transaction Costs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for cc=1:length(TC)
        cd(functionPath)
        MODEL = shortTotalRet(SSS,BNH,TC(cc),Depo,SBC(g));  % Only TC loop inputs
        folder = functionPath;
        baseFileName = sprintf('MODEL_LF_%02d_TC_%02d.mat',g,cc);
        fullFileName = fullfile(folder, baseFileName);
        save(fullFileName, 'MODEL','-v7.3')
    end
    
    
 end



