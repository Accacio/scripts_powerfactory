values = dlmread('..\data\csv\alldata.csv',';',2,0);
values_size=size(values);
fileID = fopen('..\data\csv\alldata.csv','r','n','ISO-8859-15');
element = textscan(fileID,'%q',values_size(2),'delimiter',';');
properties = textscan(fileID,'%q',values_size(2),'delimiter',';');

for i = [1:values_size(2)]
    eval(['all_data.' regexprep(element{1,1}{i,1},{' ';':';'-'},'_') ...
                  '.' regexprep(properties{1,1}{i,1},{' ';':';'-'},'_') '=values(1:end,i);'])
end
clearvars -except simulation_data

save('..\data\matlab\all_data')
