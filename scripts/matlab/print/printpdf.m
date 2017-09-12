%% Load Data
clear
clc
default_input_folder='..\..\..\data\output\matlab\simulations\';
[FileName,PathName] = uigetfile('*.mat','Select mat file with simulation data',default_input_folder);

if((strcmp(FileName,0))||((strcmp(PathName,0))))
    return;
end

FileName_noext=FileName(1:end-4);
eval(['load(''' PathName FileName ''');'])
eval(['properties=fieldnames(' FileName_noext ');'])
properties_no_time=properties(2:end);

%% Choose what to plot
element=[];
test='';
choice='Yes';
ndata=0;
while(strcmp(choice,'Yes'))
    
    i=listdlg('PromptString','Select data:','SelectionMode','Single','ListString',properties_no_time);
    if(isempty(i))
        clear
        return;
    end
    eval(['element=[fieldnames(' FileName_noext '.' properties_no_time{i} ')]'])
    j=listdlg('PromptString','Select data:','SelectionMode','Single','ListString',element);
    if(isempty(i))
        clear
        return;
    end
    
    if(isempty(test))
    test=[FileName_noext '.All_____calculations.b___tnow_____in_____s,' FileName_noext '.' properties_no_time{i} '.' element{j}]

    else
        test=[test ',' FileName_noext '.All_____calculations.b___tnow_____in_____s,' FileName_noext '.' properties_no_time{i} '.' element{j}]
    end
    
    ndata=ndata+1;
    choice = questdlg('Would you like to plot any other data?','Dessert Menu','Yes','No','No');
end

figure
eval(['plot(' test ')'])
prompt = {'Enter title:'};
defaultans={'Title'};
for i=[1:ndata]
prompt={prompt{1:end} ['Enter legend n° ' num2str(i)]};
defaultans = {defaultans{1:end} ['Legend  n°' num2str(i)'] };
end
input=inputdlg(prompt,'Input',ndata,defaultans);
if(isempty(input))
    close gcf;
    clear
    return;
end
n_title=strjoin(input(1));

title(n_title,'interpreter','latex');
legend(input(2:end));

set(gcf, 'PaperPosition', [0 0 8 8]);
set(gca,'FontSize',6); 
set(gcf, 'PaperSize', [8 8]); 
FileName=regexprep(n_title,{'\.';' ';':';'\';'/';'?';'"';'<';'>';'|'},'_');

PathName=strrep(PathName,'matlab','img');
if ~exist(PathName,'dir')
    mkdir(PathName);
end

%% Save File    
[saveFileName,PathName]=uiputfile('*.pdf','Save data as',[PathName FileName]);
saveas(gcf,[ PathName FileName '.pdf'])
clear