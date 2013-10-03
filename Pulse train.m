% script created by Richard Balson 17/02/2012
% This script is used to create pulse trains similar to those used in
% neuromodulation. These pulse trains will be used for images

% description
% ~~~~~~~~~~~
% Pulse train image creator

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



% Pulse train code
% ~~~~~~~~~~~~

t= 0:0.1:60;
y = square(t,50);

% defines bits for plotting
% ~~~~~~~~~~~~~~~~~~~~~~~~~
label_fontsize = 10;            % point
tick_fontsize = 8;              % point
fig_left_pos = 5;               % cms
fig_bottom_pos = 5;             % cms
fig_width = 8.2;                % cms
fig_height = 5;                 % cms
fig_dirname = 'c:\';              % default directory for figure files
fig_name = 'Pulsetrain.fig';
fig_dirandname = [fig_dirname fig_name];

% Plot 
% ~~~~~~~~~~~~~~~~~~~~~

figure('name','Pulsetrain',...
    'units','centimeters',...
    'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto')
plot(y)
set(gca,'fontsize',tick_fontsize)
xlabel('whatever the hell is is','fontsize',label_fontsize)
ylabel('whatever the hell is is','fontsize',label_fontsize)