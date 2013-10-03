SimEEG_Plot = figure('name',fig_settings.Simname,...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');

plot(t,DataSim,'k');
hold on
box off
minc = min(DataSim(fs:end));maxc = max(DataSim(fs:end));
axis([min(t) max(t) (minc-abs(minc)*fig_settings.Sscale) (maxc+abs(maxc)*fig_settings.Sscale)]);
if Padding >0
    line([0 0],[minc-abs(minc)*fig_settings.Sscale maxc+abs(maxc)*fig_settings.Sscale],...
        'color','r','linestyle','-.','linewidth',0.5);
    line([Seizure_end Seizure_end],[minc-abs(minc)*fig_settings.Sscale maxc+abs(maxc)*fig_settings.Sscale],...
        'color','r','linestyle','-.','linewidth',0.5);
end

% Create small axis
Data_axis = axis;
y_axis_data = Data_axis(4)-Data_axis(3);
x_axis_data = Data_axis(2)-Data_axis(1);
for j =1:10000
    if (y_axis_data)>(0.0002*5*j)
        ydata_axis =0.00002*5*(j);
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
Small_axis = axes('position',[Saxis_place(1) Saxis_place(2) xdata_axis/x_axis_data ydata_axis/(y_axis_data)],'color','none');
    set(Small_axis,'YLim',[0 2*ydata_axis],'YTick',[ydata_axis],'YTickLabel',[int2str(ydata_axis) 'mV'],...
        'Fontsize',fig_settings.tick_fontsize,'FontName',fig_settings.font_type);
    % set(get(Small_axis,'YLabel'),'String',[int2str(ydata_axis) 'mV']);
    set(Small_axis,'XLim',[0 2*xdata_axis],'XTick',[])
    set(get(Small_axis,'XLabel'),'String',[int2str(xdata_axis) 's'],...
        'fontsize',fig_settings.tick_fontsize,'fontname',fig_settings.font_type);


saveas(SimEEG_Plot,'SimEEG_Plot.fig','fig');

print(SimEEG_Plot, '-dpdf','-painters', '-r2400', 'SimEEG_Plot.pdf');






% Generate zoom fig data

if ~isempty(ZoomFig)
    ZoomFig = ZoomFig-Padding;
    
    
    EEG_Plot_Zoom = figure('name',[fig_settings.name 'Zoom'],...
        'units','centimeters',...
        'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto');
    
    plot(t,DataSim,'k');
    hold on
    box off
    axis([min(t) max(t) (minc-abs(minc)*fig_settings.Sscale) (maxc+abs(maxc)*fig_settings.Sscale)]);
    for k =1:Figures
        line([ZoomFig(k,1) ZoomFig(k,1)],[minc-abs(minc)*fig_settings.Sscale maxc+abs(maxc)*fig_settings.Sscale],...
            'color',Zoom_colors(k),'linestyle','-.','linewidth',0.5);
        line([ZoomFig(k,2) ZoomFig(k,2)],[minc-abs(minc)*fig_settings.Sscale maxc+abs(maxc)*fig_settings.Sscale],...
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
    set(Small_axis,'YLim',[0 2*ydata_axis],'YTick',[ydata_axis],'YTickLabel',[int2str(ydata_axis) 'mV'],...
        'Fontsize',fig_settings.tick_fontsize,'FontName',fig_settings.font_type);
    % set(get(Small_axis,'YLabel'),'String',[int2str(ydata_axis) 'mV']);
    set(Small_axis,'XLim',[0 2*xdata_axis],'XTick',[])
    set(get(Small_axis,'XLabel'),'String',[int2str(xdata_axis) 's'],...
        'Fontsize',fig_settings.tick_fontsize,'FontName',fig_settings.font_type);
    
    saveas(EEG_Plot_Zoom,'EEG_Plot_Zoom.fig','fig');
    
    print(EEG_Plot_Zoom, '-dpdf','-painters', '-r2400', 'EEG_Plot_Zoom.pdf');
    
    
    % Generate all zoomed in figures
    for k =1:Figures
        SimZoom_EEG(k) = figure('name',[fig_settings.name ' Zoom ' int2str(k)],...
            'units','centimeters',...
            'position',[fig_settings.left_pos fig_settings.bottom_pos zoom_fig_width zoom_fig_height],...
            'papersize',[fig_width fig_height],...
            'filename',fig_dirandname,...
            'PaperPositionMode','auto');
        
        tz = ZoomFig(k,1):1/fs:ZoomFig(k,2);
        Start_Sample = (ZoomFig(k,1)+Padding)*fs;
        DataZ = DataSim(Start_Sample:Start_Sample+length(tz)-1);
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
        set(Small_axis,'YLim',[0 2*ydata_axis],'YTick',[ydata_axis],'YTickLabel',[num2str(ydata_axis) 'mV'],...
        'Fontsize',fig_settings.tick_fontsize,'FontName',fig_settings.font_type);
        % set(get(Small_axis,'YLabel'),'String',[int2str(ydata_axis) 'mV']);
        set(Small_axis,'XLim',[0 2*xdata_axis],'XTick',[])
        set(get(Small_axis,'XLabel'),'String',[int2str(xdata_axis) 's'],...
        'Fontsize',fig_settings.tick_fontsize,'FontName',fig_settings.font_type);
        
        saveas(SimZoom_EEG(k),['SimEEG_Plot_Zoom',int2str(k),'.fig'],'fig');
        
        print(SimZoom_EEG(k), '-dpdf','-painters', '-r2400', ['SimEEG_Plot_Zoom',int2str(k),'.pdf']);
    end
    
end
