    % script created by Richard Balson 01/03/2012
    % This script creates a pie chart of epilepsy statistics

    % description
    % ~~~~~~~~~~~
    % Pots pie charts of epilepsy statistics

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
    
Prevelance = [99 1];
explode = [0 1]; 
    
    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 8.2;                % cms
    fig_height = 5;                 % cms
    fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\Images\Images\fig';              % default directory for figure files
    fig_name = 'EpilepsyPrevelance.fig';
    fig_dirandname = [fig_dirname fig_name];

    % Plot 
    % ~~~~~~~~~~~~~~~~~~~~~

    figure('name','EpilepsyPrevelance',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    pie(Prevelance,explode,{'Non-epileptic','Epileptic'});
    title('Percentage of the population with epilepsy');
