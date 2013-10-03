% script created by Richard Balson 15/07/2012
% This script is used to create pulse trains similar to those used in
% neuromodulation. These pulse trains will be used for images

% description
% ~~~~~~~~~~~
% Classification problem indicator

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
Interictal = [4 25 18]; % Matrix for interictal activity with [EXC SINH FINH]
Onset = [4 8 20]; % Matrix for onset activity with [EXC SINH FINH]
Ictal = [5 12 8]; % Matrix for ictal activity with [EXC SINH FINH]

for j = 1:points
    PIIC(j,:) = Interictal + randn(1,3)*5;
    PONS(j,:) = Onset + randn(1,3)*5;
    PICT(j,:) = Ictal + randn(1,3)*5;
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
scatter3(PIIC(:,1),PIIC(:,2),PIIC(:,3),'x','b')
hold on;
scatter3(PONS(:,1),PONS(:,2),PONS(:,3),'+','r')
hold on;
scatter3(PICT(:,1),PICT(:,2),PICT(:,3),'*','g')
axis([0 30 0 30 0 30]);
set(gca,'fontsize',tick_fontsize);
grid on
xlabel('Excitability (mV)','fontsize',label_fontsize);
ylabel('Slow Inhibition (mV)','fontsize',label_fontsize);
zlabel('Fast Inhibition (mV)','fontsize',label_fontsize);
title('Categorising problem','fontsize',label_fontsize+2);
legend('Background','InterIctal','Onset','Ictal','Location','NorthEast');
box off;

print(gcf, '-dpdf', '-r600', 'test.pdf')
