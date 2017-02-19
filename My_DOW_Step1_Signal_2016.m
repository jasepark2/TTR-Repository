
clear all

%~~~~~~~~~~~~~~~~Inputs (Only Change Area~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loadPath='C:\Test\Data' %Change1!!!
functionPath='C:\Test'
savePath='C:\Test\SSS'  %Change2!!!

%~~~~~~~~~~~~~~ Load Cleaned Files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd(loadPath)
dirData = dir('*.xlsx');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names

%~~~~~~~~~~~~~~~~~~~ Read Price Series Files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

R=250 % assigned by STW(1999)

for s=1:1  %change loop numbers if you have multiple files!!!!!~~~~~~~~~~~~~~~~

FN=fileNames(s); 
DATA=xlsread(char(FN));

Open   = DATA(:,1);
High   = DATA(:,2);
Low    = DATA(:,3);
Close  = DATA(:,4);
Volume = DATA(:,5);


%~~~~~~~~~~~~~~ Calculate Signals from Matlab~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd(functionPath)

nDATA=[Open High Low Close Volume];

[SSS] = My_DJI_Signals_withSTW_24Sep2016(nDATA,R); % incuding STW

baseFileName = sprintf('SSS_%s.mat',num2str(s,'%02i'));
save(fullfile(savePath,baseFileName),'SSS', '-v7.3')
  
%~~~~~~~~~~~~~~ Calculate Signals from Matlab~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd(savePath)
end


