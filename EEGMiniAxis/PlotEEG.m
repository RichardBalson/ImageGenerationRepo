function PlotEEG(Data,fs,Padding,ZoomFig)
% Function created  by Richard Balson 12/09/2013
% Data is a N*1 matrix specifying the EEg data of intereset, fs is the
% sampling frequency and padding is the padding prior to and post seizure
% for the data set. ZoomFig is a Z*2 matrix where Z is the number of zoomed
% in figures to generate and each row specifies the start and end point of
% the figure in time.

clc
close  all

if nargin ==2
    Padding =0;
    ZoomFig =[];
elseif nargin ==3
    ZoomFig =[];
end

figureSettings;

Samples = length(Data);
Duration = (Samples-1)/fs;

t = -Padding:1/fs:(Duration-Padding);
Seizure_end = Duration -2*Padding;

EEG_Plot = figure('name',fig_settings.name,...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');

plot(t,Data,'k');
hold on
box off
minc = min(Data);maxc = max(Data);
axis([min(t) max(t) (minc-abs(minc)*fig_settings.scale) (maxc+abs(maxc)*fig_settings.scale)]);
if Padding >0
    line([0 0],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
        'color','r','linestyle','-.','linewidth',0.5);
    line([Seizure_end Seizure_end],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
        'color','r','linestyle','-.','linewidth',0.5);
end

% Create small axis
Data_axis = axis;
y_axis_data = Data_axis(4)-Data_axis(3);
x_axis_data = Data_axis(2)-Data_axis(1);
for j =1:10000
    if (y_axis_data)>(0.0001*5*j)
        ydata_axis =0.00001*5*(j);
    else
        break
    end
end
for j =1:1000
    if x_axis_data >(10*5*j)
        xdata_axis = 5*j;
    else
        break
    end
end
axis off
Small_axis = axes('position',[axis_place(1) axis_place(2) xdata_axis/x_axis_data ydata_axis/(y_axis_data)],'color','none');
set(Small_axis,'YLim',[0 2*ydata_axis],'YTick',[ydata_axis],'YTickLabel',[int2str(ydata_axis) 'mV']);
% set(get(Small_axis,'YLabel'),'String',[int2str(ydata_axis) 'mV']);
set(Small_axis,'XLim',[0 2*xdata_axis],'XTick',[])
set(get(Small_axis,'XLabel'),'String',[int2str(xdata_axis) 's']);


saveas(EEG_Plot,'EEG_Plot.fig','fig');

print(EEG_Plot, '-dpdf','-painters', '-r2400', 'EEG_Plot.pdf');

% Generate zoom fig data

if ~isempty(ZoomFig)
    ZoomFig = ZoomFig-Padding;
    
    
    EEG_Plot_Zoom = figure('name',[fig_settings.name 'Zoom'],...
        'units','centimeters',...
        'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto');
    
    plot(t,Data,'k');
    hold on
    box off
    axis([min(t) max(t) (minc-abs(minc)*fig_settings.scale) (maxc+abs(maxc)*fig_settings.scale)]);
    for k =1:Figures
        line([ZoomFig(k,1) ZoomFig(k,1)],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
            'color',Zoom_colors(k),'linestyle','-.','linewidth',0.5);
        line([ZoomFig(k,2) ZoomFig(k,2)],[minc-abs(minc)*fig_settings.scale maxc+abs(maxc)*fig_settings.scale],...
            'color',Zoom_colors(k),'linestyle','-.','linewidth',0.5);
    end
    
    % Create small axis
    Data_axis = axis;
    y_axis_data = Data_axis(4)-Data_axis(3);
    x_axis_data = Data_axis(2)-Data_axis(1);
    for j =1:10000
        if (y_axis_data)>(0.0001*5*j)
            ydata_axis =0.00001*5*(j);
        else
            break
        end
    end
    for j =1:1000
        if x_axis_data >(10*5*j)
            xdata_axis = 5*j;
        else
            break
        end
    end
    axis off
    Small_axis = axes('position',[Zoom_axis_place(1) Zoom_axis_place(2) xdata_axis/x_axis_data ydata_axis/(y_axis_data)],'color','none');
    set(Small_axis,'YLim',[0 2*ydata_axis],'YTick',[ydata_axis],'YTickLabel',[int2str(ydata_axis) 'mV']);
    % set(get(Small_axis,'YLabel'),'String',[int2str(ydata_axis) 'mV']);
    set(Small_axis,'XLim',[0 2*xdata_axis],'XTick',[])
    set(get(Small_axis,'XLabel'),'String',[int2str(xdata_axis) 's']);
    
    saveas(EEG_Plot_Zoom,'EEG_Plot_Zoom.fig','fig');
    
    print(EEG_Plot_Zoom, '-dpdf','-painters', '-r2400', 'EEG_Plot_Zoom.pdf');
    
    
    % Generate all zoomed in figures
    for k =1:Figures
        Zoom_EEG(k) = figure('name',[fig_settings.name ' Zoom ' int2str(k)],...
            'units','centimeters',...
            'position',[fig_settings.left_pos fig_settings.bottom_pos zoom_fig_width zoom_fig_height],...
            'papersize',[fig_width fig_height],...
            'filename',fig_dirandname,...
            'PaperPositionMode','auto');
        
        tz = ZoomFig(k,1):1/fs:ZoomFig(k,2);
        Start_Sample = (ZoomFig(k,1)+Padding)*fs;
        DataZ = Data(Start_Sample:Start_Sample+length(tz)-1);
        plot(tz,DataZ,Zoom_colors(k));
        hold on
        box off
        minc = min(DataZ);maxc = max(DataZ);
        axis([min(tz) max(tz) (minc-abs(minc)*fig_settings.scale) (maxc+abs(maxc)*fig_settings.scale)]);
        Data_axis = axis;
        y_axis_data = Data_axis(4)-Data_axis(3);
        x_axis_data = Data_axis(2)-Data_axis(1);
        if k==1
            ydata_axis = 0.1;
            for j =1:10000
                if (y_axis_data)>(1*5*j)
                    ydata_axis =0.1*5*(j);
                else
                    break
                end
            end
            for j =1:1000
                if x_axis_data >(5*j)
                    xdata_axis = 0.5*j;
                else
                    break
                end
            end
        end
        axis off
        Small_axis = axes('position',[Zoom_axis_place_Z(1) Zoom_axis_place_Z(2) xdata_axis/x_axis_data ydata_axis/(y_axis_data)],'color','none');
        set(Small_axis,'YLim',[0 2*ydata_axis],'YTick',[ydata_axis],'YTickLabel',[num2str(ydata_axis) 'mV']);
        % set(get(Small_axis,'YLabel'),'String',[int2str(ydata_axis) 'mV']);
        set(Small_axis,'XLim',[0 2*xdata_axis],'XTick',[])
        set(get(Small_axis,'XLabel'),'String',[int2str(xdata_axis) 's']);
        
        saveas(Zoom_EEG(k),['EEG_Plot_Zoom',int2str(k),'.fig'],'fig');
        
        print(Zoom_EEG(k), '-dpdf','-painters', '-r2400', ['EEG_Plot_Zoom',int2str(k),'.pdf']);
    end
    
end





