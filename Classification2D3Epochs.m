% script created by Richard Balson 15/07/2012
% This script is used to create pulse trains similar to those used in
% neuromodulation. These pulse trains will be used for images

% description
% ~~~~~~~~~~~
% Classification problem indicator 2 dimensional

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

points= 20; % Specifiy number of points for each type of brain state
Interictal = [4 25]; % Matrix for interictal activity with [EXC SINH FINH]
Onset = [5 15]; % Matrix for onset activity with [EXC SINH FINH]
Ictal = [5 8]; % Matrix for ictal activity with [EXC SINH FINH]

for j = 1:points
    PIIC(j,1) = Interictal(1) + randn(1,1);PIIC(j,2) = Interictal(2) + randn(1,1)*5;
    PONS(j,1) = Onset(1) + randn(1,1);PONS(j,2) = Onset(2) + randn(1,1)*3;
    PICT(j,1) = Ictal(1) + randn(1,1);PICT(j,2) = Ictal(2) + randn(1,1)*3;
end



% Classification problem
% ~~~~~~~~~~~~



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

figure('name','Categorising problem',...
    'units','centimeters',...
    'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto')
scatter(PIIC(:,1),PIIC(:,2),'x','g')
hold on;
scatter(PONS(:,1),PONS(:,2),'+','y')
hold on;
scatter(PICT(:,1),PICT(:,2),'*','r')
axis([0 20 0 30]);
set(gca,'fontsize',tick_fontsize);
legend('InterIctal','Preictal','Ictal','Location','NorthEast');
xlabel('Excitation (mV)','fontsize',label_fontsize);
ylabel('Inhibition (mV)','fontsize',label_fontsize);
title('Categorising problem','fontsize',label_fontsize+2);
box off;

print(gcf, '-dpdf', '-r600', 'Categorising working.pdf')
