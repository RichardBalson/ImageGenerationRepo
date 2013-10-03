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
pulseet = 55; % Pulse end time
width =pulseperiod/2; % Width of pulses
biasmats =  pulseet/timestep + pulseperiod/(4*timestep)+1;  % Create starting point in matrix
ebiasmats = endtime/timestep +1;

% Pulse train code
% ~~~~~~~~~~~~


d = 0:pulseperiod:pulseet; % Set pulse frequency and duration

y = pulstran(t1,d,'rectpuls',width)*2-1; % Creates biased pulse train, duration of t1.
y(1,biasmats:ebiasmats)= y(1,biasmats:ebiasmats)+1; % Bias data for simulation

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
plot(t1,y)
hold on;
axis([0 120 -2 2]);
set(gca,'fontsize',tick_fontsize);
xlabel('Time(ms)','fontsize',label_fontsize);
ylabel('Current Intensity(mA)','fontsize',label_fontsize);
title('Biphasic pulse train stimulation','fontsize',label_fontsize+2);
grid on;

annotation('line',[0.1783 0.2418],[0.6412 0.6412],...
    'LineWidth',2,...
    'Color',[0 0 1]);


annotation('line',[0.3224 0.3224],[0.53 0.70],...
    'LineWidth',2,...
    'Color',[0.8471 0.1608 0]);


annotation('line',[0.1307 0.5017],[0.449 0.449],...
    'LineWidth',2,...
    'Color',[0 1 0]);


annotation('line',[0.501 0.9048],[0.4912 0.4912],...
    'LineWidth',2);

annotation('line',[0.1783 0.2091],[0.6881 0.6881],...
    'LineWidth',2,...
    'Color',[1 0 0]);
