    % script created by Richard Balson 01/03/2012
    % This script creates a bar chart of the connectivity constants

    % description
    % ~~~~~~~~~~~
    % Plots bar chart of connectivity constants

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
    
    Con = 135;
    
    C = [Con 0.8*Con 0.25*Con 0.25*Con 0.3*Con 0.1*Con 0.8*Con];
    
    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 8.2;                % cms
    fig_height = 5;                 % cms
    fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\Images\Images\fig';              % default directory for figure files
    fig_name = 'PSP2FR.fig';
    fig_dirandname = [fig_dirname fig_name];

    % Plot 
    % ~~~~~~~~~~~~~~~~~~~~~

    figure('name','PSP2FR',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    bar(C,'group');
    set(gca,'fontsize',tick_fontsize)
    xlabel('Voltage(mV)','fontsize',label_fontsize)
    ylabel('Firing rate(Hz)','fontsize',label_fontsize)
    title('PSP to firing rate kernel');
    grid on;
