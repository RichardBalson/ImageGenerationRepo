    % script created by Richard Balson 01/03/2012
    % This script is used to creat an image of the sigmoid function

    % description
    % ~~~~~~~~~~~
    % Plot of sigmoid function

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

    e =0.5;      %sigmoid parameters, maximal firing rate of neuronal population

% Units mV
% ~~~~~~~~~~~~

k =6;        %v0  PSP at which 50% of maximum firing rate is achieved
v = -5:1e-3:20;

% Units mV^(-1)
% ~~~~~~~~~~~

r =.56; % Indicates the steepness of the sigmoid funtion
    
% Equations
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

s = 2*e./(1+exp(r*(k-v))); % Equation to convert PSP into a firing rate
    
    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 5;                % cms
    fig_height = 3.2;                 % cms
    fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\Images\Images\fig';              % default directory for figure files
    fig_name = 'PSP2FR.fig';
    fig_dirandname = [fig_dirname fig_name];
    legend_fontsize =8;
    legend_font = 'Arial';
    
    % Plot 
    % ~~~~~~~~~~~~~~~~~~~~~

    figure('name','PSP2FR',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    plot(v,s,'k');
    set(gca,'fontsize',tick_fontsize)
    xlabel('Membrane Voltage (mV)','fontsize',label_fontsize)
    ylabel('Firing rate (Hz)','fontsize',label_fontsize)
    title('PSP to Firing Rate Function','fontsize',label_fontsize);
    box off;
    print(gcf, '-dpdf', '-r600', 'PSP2FR.pdf')
    
    
    
        figure('name','PSP2FRNaming',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    Sig=plot(v,s,'k');
    hold on
%     plot(k,e,'r*');
    
%     text(k*0.25,e*1.25,'(k,\epsilon_{0})','fontname', legend_font, 'fontsize',legend_fontsize);
%         line([k,k],[0 2*e],'Color','r','LineStyle','--'); 
    h = gca;
%     line([v(1) v(end)],[e e],'Color','g','LineStyle','--'); 
    
    % Gradient line
%     constant = e-(2*e*r/4)*k; % Gradient at (k,e) = r/4
%     linev = (k-1):0.05:(k+1);
%     linef = (2*e*r/4)*linev + constant;
%     Grad=plot(linev,linef,'b','linewidth',2);
%     line([linev(end),linev(end)],[linef(1) linef(end)],'Color','g','LineStyle',':','linewidth',2); 
%     line([linev(1),linev(end)],[linef(1) linef(1)],'Color','g','LineStyle',':','linewidth',2); 
%     k=legend([Sig Grad],'g(v)', '\propto r','Location','SouthEast');%,'k','\epsilon_{0}');
    line([k,k],[0 2*e],'Color','r','LineStyle','--'); 
    k=legend('g(v)','v_{0}','Location','SouthEast');
    legend(k,'boxoff');
    set([k gca],'FontName',legend_font,'fontsize',legend_fontsize);
    f = findobj('type', 'line');
    set(f(2), 'XData', [.4, .6]); % Changes line three
    set(f(4), 'XData', [.4, .6]); % Changes line two
    
    box off;
    set(gca,'fontsize',tick_fontsize)
    xlabel('Membrane Voltage (mV)','fontsize',label_fontsize)
    ylabel('Firing rate (Hz)','fontsize',label_fontsize)
%     title('PSP to Firing Rate Function','fontsize',label_fontsize);
    box off;
    axis tight;
    print(gcf, '-dpdf', '-r600', 'PSP2FRNaming.pdf')