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

SpecifyFilenamesComp;
figureSettings;

Seizures = length(StatesFilename);

min_data = ones(Number_of_states)*inf;
max_data=ones(Number_of_states)*-inf;
Legend_data = cell(Seizures,1);
DurationT =inf;

for k =1:Seizures
    
    Legend_data{k} = ['SZ ', int2str(k)];
    
    [X Data] = CollateDataComp(StatesFilename,k,fs);
    
    [States, Samples] = size(X);
    
    Duration(k) = Samples/fs;
    t = -Padding:1/fs:(Duration(k)-Padding-1/fs);
    Seizure_end(k) = Duration(k) -2*Padding;
    if k==1
        SeizureSim = figure('name',fig_settings.name,...
            'units','centimeters',...
            'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
            'papersize',[fig_width fig_height],...
            'filename',fig_dirandname,...
            'PaperPositionMode','auto');
    else
        figure(SeizureSim);
    end
    Data_plot(k)=subplot(Number_of_states,1,k);plot(t(1:end-1),Data,Seizure_colors(k));
    hold on
    box off
    minc = min(Data(fs:end));maxc = max(Data(fs:end));
    axis([min(t) max(t) (minc-abs(minc)*fig_settings.scale) (maxc+abs(maxc)*fig_settings.scale)]);
    Data_axis(k,:) = axis;
    
    ylabel('EEG (mV)','fontsize',label_fontsize,'fontname',fig_settings.font_type);
    line([Seizure_end(k) Seizure_end(k)],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
        'color',Seizure_colors(k),'linestyle','-.','linewidth',0.5);
    if k == Seizures
        xlabel('Time (s)','fontsize',label_fontsize,'fontname',fig_settings.font_type);
    else
        set(gca,'xticklabel',{})
    end
    set(gca,'YTick',[-5 0 5]);
    
    % Plot figure with parameter results
    
    if k==1
        ParameterPlot = figure('name',fig_settings.name,...
            'units','centimeters',...
            'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
            'papersize',[fig_width fig_height],...
            'filename',fig_dirandname,...
            'PaperPositionMode','auto');
    else
        figure(ParameterPlot);
    end
    for j = 1:Number_of_states
        PP(j) = subplot(Number_of_states,1,j);plot(t,X(State_order(j),1:length(t)),Seizure_colors(k));
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
            PP_axis(j,:) = axis;
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
                set(gca,'YTick',[0 300 600]);
            elseif j ==3
                set(gca,'YTick',[40 80 120]);
            elseif j ==2
                set(gca,'YTick',[0 15 30]);
            elseif j ==1
                set(gca,'YTick',[3 6 9]);
            end 
            for k =1:Seizures
                        subplot(Number_of_states,1,j),line([Seizure_end(k) Seizure_end(k)],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
                'color',Seizure_colors(k),'linestyle','-.','linewidth',0.5);
            end
        end

    end
    
end

DurationF = min(Duration);
tF = -Padding:1/fs:(DurationF-Padding-1/fs);
for k =1:Seizures
    axis(PP(k),[min(tF) max(tF) PP_axis(k,3) PP_axis(k,4)]);
end
LegD = legend(Legend_data,'Location',legLoc,'Orientation',legOri);
legend(LegD,'boxoff');
set(LegD,'fontsize',fig_settings.legend_fontsize,'fontname',fig_settings.font_type);

figure(SeizureSim)
for k =1:Seizures
    axis(Data_plot(k),[min(tF) max(tF) Data_axis(k,3) Data_axis(k,4)]);
end



saveas(ParameterPlot,'AnimalComp.fig','fig');

print(ParameterPlot, '-dpdf','-painters', '-r2400', 'AnimalComp.pdf');

saveas(SeizureSim,'SeizureSim.fig','fig');

print(SeizureSim, '-dpdf','-painters', '-r2400', 'SeizureSim.pdf');

