clear 
clc
%% Get File
default_input_folder='..\..\..\data\output\csv\simulations\';
[FileName,PathName] = uigetfile('*.csv','Select CSV file with simulation data',default_input_folder);
FileName=FileName(1:end-4);

%% Process File
values = dlmread([PathName FileName '.csv'],';',2,0);
values_size=size(values);
fileID = fopen([PathName FileName '.csv'],'r','n','ISO-8859-15');
element = textscan(fileID,'%q',values_size(2),'delimiter',';');
properties = textscan(fileID,'%q',values_size(2),'delimiter',';');

% Create structure with csv data
for i = [1:values_size(2)]
    eval([FileName '.' regexprep(element{1,1}{i,1},{'\.';':';'-';' ';'\'},{'__';'___';'____';'_____';'______'}) ...
                  '.' regexprep(properties{1,1}{i,1},{'\.';':';'-';' ';'\'},{'__';'___';'____';'_____';'______'}) '=values(1:end,i);'])
end
eval(['clearvars -except ' FileName ' FileName PathName' ])
newPathName=strrep(PathName,'csv','matlab');
if ~exist(newPathName,'dir')
    mkdir(newPathName);
end
%%Save File    
[saveFileName,PathName]=uiputfile('*.mat','Save data as',[newPathName FileName]);
save([PathName saveFileName], FileName);
clear

