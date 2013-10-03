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

    for j = 1:length(Gain)

    a = [0 1; -(tconstant(j)^2) -2*tconstant(j)]; % Descibe equation as dx/dt = a*x + b*u; y=c*x + d*u (1)
    b = [0;Gain(j)*tconstant(j)];                 % Using this form for dy1/dt = y2
    c = [1 0];                              % dy2/dt = Gain*tconstant*u-2*tconstant*y2-tconstant^2*y1
    d = 0;
    sys(j) = ss(a,b,c,d);                      % Ued to create a system of form described in (1)
    end
    tf = 0.2;

    % Impulse response code
    % ~~~~~~~~~~~~~~~

    [x t1] = impulse(sys(1),tf);
    [y t2] = impulse(sys(2),tf);
    [z t3] = impulse(sys(3),tf);
    
    z = z*(-1); % Negative response as gains are inhibitory
    y = y*(-1);
    
    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 8;                % cms
    fig_height = 6;                 % cms
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
    xlabel('Time (s)','fontsize',label_fontsize)
    ylabel('Membrane Voltage (mV)','fontsize',label_fontsize)
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
    line([1/tconstant(1),1/tconstant(1)],[0 Gain(1)*exp(-1)],'Color','r','LineStyle','--'); 
    h = gca;
    line([0 6/tconstant(1)],[Gain(1)*exp(-1) Gain(1)*exp(-1)],'Color','g','LineStyle','--'); 
    legend(h,'h_{mn}(t)','\tau_{b}','\propto G_{b}');
    set(gca,'fontsize',tick_fontsize)
    xlabel('Time (s)','fontsize',label_fontsize)
    ylabel('Membrane Voltage (mV)','fontsize',label_fontsize)
%     title('Impulse Response of Firing rate to PSP
%     Kernels','fontsize',label_fontsize);
    box off;
    k=legend('Location','NorthEast');
    legend(k,'boxoff');
    set([k gca],'FontName',legend_font,'fontsize',legend_fontsize);
    print(gcf, '-dpdf', '-r600', 'FR2PSPNaming.pdf')