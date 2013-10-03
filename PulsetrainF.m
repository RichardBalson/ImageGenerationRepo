% script created by Richard Balson 17/10/2011
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


% Parameters setup 
% ~~~~~~~~~~~~~~~~~~~~

pulseperiod = 10; % Pulse period Reltaes to frequency as f = (1000*(1/pilseperiod))
timestep = .1; % Time increment for sampling 
starttime =0; 
endtime = 120;


t1 = starttime:timestep:endtime; % Pulse time
pulsestart =20; % When pulse starts
pulseet = 75; % Pulse end time
width =pulseperiod/5; % Width of pulses


% Pulse train code
% ~~~~~~~~~~~~


d = pulsestart:pulseperiod:pulseet; % Set pulse frequency and duration
d1 = d-2.7; % Set pulse frequnecy and duration for negative pulse

x= pulstran(t1,d1,'rectpuls',width); % Creates biased pulse train, duration of t1.
y = pulstran(t1,d,'rectpuls',width); % Creates biased pulse train, duration of t1.
y = y-x; % Bias data for simulation

% defines bits for plotting
% ~~~~~~~~~~~~~~~~~~~~~~~~~
label_fontsize = 10;            % point
tick_fontsize = 8;              % point
fig_left_pos = 5;               % cms
fig_bottom_pos = 5;             % cms
fig_width = 8.2;                % cms
fig_height = 5;                 % cms
fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\';              % default directory for figure files
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
plot(t1,y,'k')
hold on;
axis([0 120 -1.5 1.5]);
set(gca,'fontsize',tick_fontsize);
xlabel('Time (ms)','fontsize',label_fontsize);
ylabel('Current Intensity (mA)','fontsize',label_fontsize);
title('Biphasic pulse train stimulation','fontsize',label_fontsize+2);
grid off;
box off;

annotation('line',[0.255 0.315],[0.24 0.24],...
    'LineWidth',2,...
    'Color',[0 0 1]);


annotation('line',[0.65 0.65],[0.525 0.76],...
    'LineWidth',2,...
    'Color',[0.8471 0.1608 0]);


annotation('line',[0.255 0.6],[0.449 0.449],...
    'LineWidth',2,...
    'Color',[0 1 0]);


annotation('line',[0.27 0.285],[0.8 0.8],...
    'LineWidth',2,...
    'Color',[1 0 0]);
print(gcf, '-dpdf', '-r600', 'test.pdf')
