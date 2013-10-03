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
v = -5:1e-5:20;

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
    fig_width = 4.6;                % cms
    fig_height = 3;                 % cms
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
%     xlabel('Membrane Voltage (mV)','fontsize',label_fontsize)
%     ylabel('Firing rate (Hz)','fontsize',label_fontsize)
%     title('PSP to Firing Rate Function','fontsize',label_fontsize);
    box off;
    axis off
    print(gcf, '-dpdf', '-r600', 'PSP2FRBasic.pdf')
    