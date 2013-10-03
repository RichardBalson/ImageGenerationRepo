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

SpecifyFilenamesMulti;
figureSettings;

Seizures = length(StatesFilename);

min_data = ones(Number_of_states)*inf;
max_data=ones(Number_of_states)*-inf;
Legend_data = cell(Seizures,1);
DurationT =inf;

ParameterPlot = figure('name',fig_settings.name,...
            'units','centimeters',...
            'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
            'papersize',[fig_width fig_height],...
            'filename',fig_dirandname,...
            'PaperPositionMode','auto');
for k =1:Seizures
    
    load(StatesFilename{k},'X_Multi');
    X = mean(X_Multi,3);
    stdX = std(X_Multi,0,3);
    
    [Samples, Number_of_States] = size(X);
    Duration = Samples/fs*Decimate;
    t = -Padding:(Decimate/fs):Duration-Padding;
    t = t(1:end-1);
    Seizure_end(k) = Duration - 2*Padding;

    for j = 1:Number_of_states
        PP(j) = subplot(Number_of_states,1,j);plot(t,X(:,State_order(j)),Seizure_colors(k));
        hold on
        Error = [X(:,State_order(j))+stdX(:,State_order(j)),X(:,State_order(j))-stdX(:,State_order(j))]
        plot(t,Error',stdColor(k));
%         plot(t,X(:,State_order(j))-stdX(:,State_order(j)),stdColor(k));
        box off
        min_dataT = min(Error(fs:length(t),2));min_data(j) = min(min_dataT,min_data(j));
        max_dataT = max(Error(fs:length(t),1));max_data(j) = max(max_dataT,max_data(j));
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


saveas(ParameterPlot,'MultipleInit.fig','fig');

print(ParameterPlot, '-dpdf','-painters', '-r2400', 'MultipleInit.pdf');

