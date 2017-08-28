clear 
% Get File
values = dlmread('..\..\data\output\csv\alldata.csv',';',2,0);
values_size=size(values);
fileID = fopen('..\..\data\output\csv\alldata.csv','r','n','ISO-8859-15');
element = textscan(fileID,'%q',values_size(2),'delimiter',';');
properties = textscan(fileID,'%q',values_size(2),'delimiter',';');

% Create structure with csv data
for i = [1:values_size(2)]
    eval(['all_data.' regexprep(element{1,1}{i,1},{'\.';':';'-';' ';'\'},{'_';'__';'___';'____';'_____'}) ...
                  '.' regexprep(properties{1,1}{i,1},{'\.';':';'-';' ';'\'},{'_';'__';'___';'____';'_____'}) '=values(1:end,i);'])
end
clearvars -except all_data

% Save structure in .mat
% save('..\..\data\output\matlab\all_data')
save('all_data')