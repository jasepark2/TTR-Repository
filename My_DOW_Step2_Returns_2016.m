
clear all

%=========================================================================%
%~~~~~~~~~~~~~~Part 1: Before Loop Inputs~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
%=========================================================================%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Common Inputs (Only Change Area)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%~~~~~~~~~~~~~~~~FIles and Folders Locations ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loadPath='C:\Test\Data' %Change1!!!
functionPath='C:\Test'
sssPath='C:\Test\SSS'
savePath='C:\Test\Return'  % for BNH,MODELChange2!!!


% Transactio costs

TC=[0,0.0005,0.001];% {0,5,10,15,20bps}
SBC= [0,0.001];% Stock borrowing costs (0.002, 0.001, 0)

%=========================================================================%
%~~~~~~~~~~~~~~Part 2: Generate Investment Returns~~~~~~~~~~~~~~~~~~~~~~~~%
%=========================================================================%

 for g=1:length(SBC) % 
     for s=1:1 % length of data files

%~~~~~~~~~~~~~~ Load Signals from New Indicators ~~~~~~~~~~~~~~~~~~~~~~~~~~

cd(sssPath)

FN=sprintf('SSS_%02d.mat',s);
SSS=load(char(FN));
SSS=struct2cell(SSS);
SSS=cell2mat(SSS);
SSS(isnan(SSS))=0;

TT=size(SSS,1);
T=TT-1; % length for returns
R=1;
N=TT-R;

%~~~~~~~~~~~~~~ load price and deposit data   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd(loadPath)

dirData = dir('*.xlsx');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names

FN=fileNames(s);
DATA=xlsread(char(FN));


Close=DATA(:,4); % change !!
volume=DATA(:,5);
deposit=DATA(:,6);
Depo= log(1+deposit./100)/251; % Daily interest charge

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate Buy & Hold Return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd(functionPath)

%Buy & Hold (BNH)

BNH=zeros(TT,1);
for(t=2:TT); % returnd start from second day..
BNH(1)=0;
BNH(t) = log(Close(t)/Close(t-1));
end

folder = savePath;
baseFileName = sprintf('BNH_%s.mat',num2str(s,'%02i'));
fullFileName = fullfile(folder, baseFileName);
save(fullFileName, 'BNH');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculation of Conditional Returns based on Transaction Costs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for cc=1:length(TC)
        cd(functionPath)
        MODEL = shortTotalRet(SSS,BNH,TC(cc),Depo,SBC(g));  % Only TC loop inputs
        folder = savePath;
        baseFileName = sprintf('MODEL_%02d_LF_%02d_TC_%02d.mat',s,g,cc);
        fullFileName = fullfile(folder, baseFileName);
        save(fullFileName, 'MODEL','-v7.3')
    end
    
    cd(savePath)
 end
end




