
clear all

%~~~~~~~~~~~~~~~~Inputs (Only Change Area~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
loadPath='E:\USA DJI\Data\Data333' %Change1!!!
functionPath='E:\USA DJI\Step1_Trading Rules_2016'
savePath='E:\USA DJI\SSS'  %Change2!!!

%~~~~~~~~~~~~~~ Load Cleaned Files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd(loadPath)
dirData = dir('*.xlsx');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names

%~~~~~~~~~~~~~~~~~~~ Read Price Series Files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

R=1

for s=1:9  %change!!!!!~~~~~~~~~~~~~~~~

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
cd(loadPath)
end


