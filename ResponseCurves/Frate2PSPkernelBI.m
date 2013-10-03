    % script created by Richard Balson 27/02/2012
    % This script is used to create pulse trains similar to those used in
    % neuromodulation. These pulse trains will be used for images

    % description
    % ~~~~~~~~~~~
    % Impulse response of firing rte to potential converter

    % last edit
    % ~~~~~~~~~


    % next edit
    % ~~~~~~~~~

    % Beginning of script
    % ~~~~~~~~~~~~~~~~~~~~~

    % Clear workspace
    % ~~~~~~~~~~~
    clear
    close all
    clc


    % Parameter definition
    % ~~~~~~~~~~~~~~~

    Gain = [3.25 22 10]; % Gain of converter kernel
    tconstant = [100 50 500]; % Time constant of converter kernel

    % Equation definition
    % ~~~~~~~~~~~~~~~~

%     [x y z] = zeros(100);  % Initialise output
%     t = zeros(1,1000);  % Initialise output

% Analytical solution
t1 = 0:0.00005:0.15;
x = t1*Gain(1)*tconstant(1).*exp(-t1*tconstant(1));
 t2 =  0:0.0001:0.15;
y = -t2*Gain(2)*tconstant(2).*exp(-t2*tconstant(2)); 
z = -t2*Gain(3)*tconstant(3).*exp(-t2*tconstant(3)); 
t3 = t2;
    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 5;                % cms
    fig_height = 3.2;                 % cms
    fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\Images\Images\fig';              % default directory for figure files
    fig_name = 'FR2PSPKernel.fig';
    fig_dirandname = [fig_dirname fig_name];
    legend_fontsize =8;
    legend_font = 'Arial';

    % Plot 
    % ~~~~~~~~~~~~~~~~~~~~~
 

    figure('name','FR2PSPKernel',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    plot(t1,x,'k');
    hold on
    plot(t2,y,'r');
    hold on
    plot(t3,z,'g');
    h = gca;
    legend(h,'Excitatory PSP','Slow inhibitory PSP','Fast inhibitory PSP');
    set(gca,'fontsize',tick_fontsize)
    xlabel('Time (s)','fontsize',fig_settings.label_fontsize)
    ylabel('Membrane Voltage (mV)','fontsize',fig_settings.label_fontsize)
%     title('Impulse Response of Firing rate to PSP
%     Kernels','fontsize',label_fontsize);
    box off;
    k=legend('Location','SouthEast');
    legend(k,'boxoff');
    set([k gca],'FontName',legend_font,'fontsize',legend_fontsize);
    print(gcf, '-dpdf', '-r600', 'FR2PSP.pdf')
    
    
    
    
    figure('name','Individual components',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
        plot(t1,x,'k');
    hold on
    line([1/tconstant(1),1/tconstant(1)],[0 Gain(1)*exp(-1)],'Color','r');%,'LineStyle','--'); 
    h = gca;
    line([0 6/tconstant(1)],[Gain(1)*exp(-1) Gain(1)*exp(-1)],'Color','g');%,'LineStyle','--'); 
    legend(h,'h_{mn}(t)','\tau','\propto \alpha');
    set(gca,'fontsize',tick_fontsize)
    xlabel('Time (s)','fontsize',label_fontsize)
    ylabel('Potential (mV)','fontsize',label_fontsize)
%     title('Impulse Response of Firing rate to PSP
%     Kernels','fontsize',label_fontsize);
    box off;
    k=legend('Location','NorthEast');
    legend(k,'boxoff');
    set([k gca],'FontName',legend_font,'fontsize',legend_fontsize);
    f = findobj('type', 'line');
    set(f(2), 'XData', [.4, .6]); % Changes line three
    set(f(4), 'XData', [.4, .6]); % Changes line two
    set(f(6), 'XData', [.4, .6]); % Changes line one
    axis([min(t1) max(t1) 0 max(x)*1.05]);
    print(gcf, '-dpdf', '-r1200','-painters', 'FR2PSPNamingBI.pdf')