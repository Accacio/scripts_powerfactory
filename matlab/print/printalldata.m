load('.\all_data.mat')
properties=fieldnames(all_data)
for i = [1:size(properties,1)]
    eval(['element=fieldnames(all_data.' properties{i} ')'])
end