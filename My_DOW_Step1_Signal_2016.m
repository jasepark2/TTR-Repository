
clear all

%~~~~~~~~~~~~~~~~Inputs (Only Change Area~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

functionPath='C:\Test'
savePath='C:\Test\SSS'  %Change2!!!

%~~~~~~~~~~~~~~ Load Cleaned Files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dirData = dir('*.xlsx');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names

%~~~~~~~~~~~~~~~~~~~ Read Price Series Files ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

R=250 % assigned by STW(1999)

cd(functionPath)
 
DATA=xlsread('sampleDJIA');

Open   = DATA(:,1);
High   = DATA(:,2);
Low    = DATA(:,3);
Close  = DATA(:,4);
Volume = DATA(:,5);


%~~~~~~~~~~~~~~ Calculate Signals from Matlab~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

nDATA=[Open High Low Close Volume];

[SSS] = My_DJI_Signals_withSTW_24Sep2016(nDATA,R); % incuding STW

save('SSS.mat','SSS', '-v7.3')
  



