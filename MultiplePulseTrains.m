% script created by Richard Balson 26/08/2012
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

pulseperiod = 1000/(130); % Pulse period Relates to frequency as f = (1000*(1/pulseperiod))
timestep = 5e-5; % Time increment for sampling 
starttime =0; 
endtime = 1200;


t1 = starttime:timestep:endtime; % Pulse time
pulsestart =[100 700]; % When pulse starts
pulseet = [pulsestart(1)+60 pulsestart(2)+60]; % Pulse end time
width =450e-6; % Width of pulses


% Pulse train code
% ~~~~~~~~~~~~


d = pulsestart(1):pulseperiod:pulseet(1); % Set pulse frequency and duration
d1 = d-2.7; % Set pulse frequnecy and duration for negative pulse
d2 = pulsestart(2):pulseperiod:pulseet(2); % Set pulse frequency and duration
d3 = d2-2.7;

x= pulstran(t1,d1,'rectpuls',width); % Creates biased pulse train, duration of t1.
y = pulstran(t1,d,'rectpuls',width); % Creates biased pulse train, duration of t1.
x1= pulstran(t1,d3,'rectpuls',width); % Creates biased pulse train, duration of t1.
y1 = pulstran(t1,d2,'rectpuls',width); % Creates biased pulse train, duration of t1.
y2 = y+y1-x-x1; % Bias data for simulation

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
plot(t1,y2,'k')
hold on;
axis([0 endtime -1.5 1.5]);
set(gca,'fontsize',tick_fontsize);
xlabel('Time (ms)','fontsize',label_fontsize);
ylabel('Current Intensity (mA)','fontsize',label_fontsize);
title('Velasco Stimulation Strategy','fontsize',label_fontsize+2);
grid off;
box off;

print(gcf, '-dpdf', '-r600', 'Velasco_Stimulation_Strategy.pdf')

figure('name','Pulsetrain (Zoomed In)',...
    'units','centimeters',...
    'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto')
plot(t1,y2,'k')
hold on;
axis([pulsestart(1)-20 pulsestart(1)+80 -1.5 1.5]);
set(gca,'fontsize',tick_fontsize);
xlabel('Time (ms)','fontsize',label_fontsize);
ylabel('Current Intensity (mA)','fontsize',label_fontsize);
title('Velasco Stimulation Strategy','fontsize',label_fontsize+2);
grid off;
box off;

print(gcf, '-dpdf', '-r600', 'Velasco_Stimulation_Strategy (Zoomed in).pdf')