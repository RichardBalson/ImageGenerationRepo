function SeizureParametersPlot(fs,Padding)
% Function created  by Richard Balson 12/09/2013
% States is a cell with length  equal to the number of seizures, and Dx*N
% elements in each cell where Dx is the number of states and N is the
% number of samples

if nargin ==0
    fs =2048;
    Padding =150;
end
clc
close all

SpecifyFilenames;
figureSettings;

Seizures = length(StatesFilename);

min_data = ones(Number_of_states)*inf;
max_data=ones(Number_of_states)*-inf;
Legend_data = cell(Seizures,1);

for k =1:Seizures
    
    Legend_data{k} = ['SZ ', int2str(k)];
    
    [X Data] = CollateData(Datafilenames,StatesFilename,k);
    
    [States, Samples] = size(X);
    
    if k ==1
        Duration = Samples/fs;
        t = -Padding:1/fs:(Duration-Padding-1/fs);
        Seizure_end = Duration -2*Padding;
        Parameter_plot = figure('name',fig_settings.name,...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
        Data_plot=subplot(Number_of_states+1,1,1);plot(t(1:end-1),Data,Seizure_colors(k));
        hold on  
        box off
        minc = min(Data);maxc = max(Data);
        axis([min(t) max(t) (minc-abs(minc)*fig_settings.scale) (maxc+abs(maxc)*fig_settings.scale)]);
        Data_axis = axis;
        set(gca,'xticklabel',{});
        set(gca,'YTick',[-0.4 0 0.4]);
        ylabel('EEG (mV)','fontsize',label_fontsize,'fontname',fig_settings.font_type);
        line([Seizure_end Seizure_end],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
            'color',Seizure_colors(k),'linestyle','-.','linewidth',0.5);
    else
        DurationT = Samples/fs;
        Seizure_end(k) = DurationT -2*Padding;
        if (DurationT < Duration)
            t = -Padding:1/fs:(DurationT-Padding-1/fs);
        end
    end
    for j = 1:Number_of_states
        subplot(Number_of_states+1,1,1+j),plot(t,X(State_order(j),1:length(t)),Seizure_colors(k));
        hold on
        box off
        min_dataT = min(X(State_order(j),fs:length(t)));min_data(j) = min(min_dataT,min_data(j));
        max_dataT = max(X(State_order(j),fs:length(t)));max_data(j) = max(max_dataT,max_data(j));
        ylabel(State_names(j),'fontsize',label_fontsize,'fontname',fig_settings.font_type);
        if j == Number_of_states
            xlabel('Time (s)','fontsize',label_fontsize,'fontname',fig_settings.font_type);
        end
        if k == Seizures
%             Leg = legend(Legend_data,'Location',legLoc,'Orientation',legOri);
%             legend(Leg,'boxoff');
%             set(Leg,'fontsize',fig_settings.legend_fontsize);
            minc = min_data(j);maxc = max_data(j);
            axis([min(t) max(t) (minc-abs(minc)*fig_settings.scale) (maxc+abs(maxc)*fig_settings.scale)]);
            L = get(gca,'YLim');
%             if L(1) <0
%              set(gca,'YTick',[floor(L(1))+1 0  ceil(L(2))-1])   
%             else
%             set(gca,'YTick',linspace(0,ceil(L(2))-1,Num_ticks))
%             end
            if j~= Number_of_states
                set(gca,'xticklabel',{})
            end
            if j == Number_of_states
                set(gca,'YTick',[100 200 300]);
            elseif j ==3
                set(gca,'YTick',[0 30 60]);
            elseif j ==2
                set(gca,'YTick',[-20 0 20]);
            elseif j ==1
                set(gca,'YTick',[0 5 10]);
            end
            for h =1:Seizures
               subplot(Number_of_states+1,1,1+j),line([Seizure_end(h) Seizure_end(h)],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
                   'color',Seizure_colors(h),'linestyle','-.','linewidth',0.5);
            end
            
        end
    end
    
end

LegD = legend(Legend_data,'Location',legLoc,'Orientation',legOri);
legend(LegD,'boxoff');
set(LegD,'fontsize',fig_settings.legend_fontsize,'fontname',fig_settings.font_type);

axis(Data_plot,[min(t) max(t) Data_axis(3) Data_axis(4)]);
    
saveas(Parameter_plot,'Multiple_Seizure_Parameters.fig','fig');
          
print(Parameter_plot, '-dpdf','-painters', '-r2400', 'Multiple_Seizure_Parameters.pdf');


