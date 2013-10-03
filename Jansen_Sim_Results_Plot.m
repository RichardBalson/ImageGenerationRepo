% script created by Richard Balson 25/11/2012

% description
% ~~~~~~~~~~~
% This script produces a contour plot of the results from the Jansen and
% Rit Model

% last edit
% ~~~~~~~~~

% 

% next edit
% ~~~~~~~~~

% 

% Beginning of script
% ~~~~~~~~~~~~~~~~~~~~~

% Clear workspace
% ~~~~~~~~~~~
clear
close all
clc
%%

% Dynamic variables
% ~~~~~~~~~~~~~~~~~~~~~~~~~~

DA = 9; % Number of different values for A
DB = 41; % Number of different values for B

Max_A =7;% Specify maximum value for A
Min_A =3; % Specify minimum value for A

Max_B = 40;% Specify maximum value for B
Min_B=0;% Specify minimum value for B

Bg =1; % Specify simulation value for background iEEG
Sz =2.5;  % Specify simulation value for seizure iEEG
Ss =1.5;  % Specify simulation value forsporadic spiking iEEG
Ar =2; % Specify simulation value for alpha rhythms iEEG

% Static Varaibles
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A_values = linspace(Min_A,Max_A,DA); % Specify all values for A

B_values = linspace(Min_B,Max_B,DB); % Specify all values for B

% Simulation Results
% ~~~~~~~~~~~~~~~~~~~~~

Sim_out(1,:) = [Bg*ones(1,21) Ss*ones(1,4) Bg Ss*ones(1,10) Bg*ones(1,5)]; % Specify results for A=3
Sim_out(2,:) = [Bg*ones(1,14) Ss Bg Bg Ss Ss Ar*ones(1,4) Ss Ss Ss Ar Ss*ones(1,4) Ar Ss*ones(1,4) Ar Ar Ar Ss Ss]; % Specify results for A=3.5
Sim_out(3,:) = [Bg*ones(1,13) Ss*ones(1,4) Ar*ones(1,24)]; % Specify results for A=4
Sim_out(4,:) = [Bg*ones(1,13) Ss Ss Ar*ones(1,26)]; % Specify results for A=4.5
Sim_out(5,:) = [Bg*ones(1,13) Ss Ss Ar*ones(1,23) Sz Sz Sz];
Sim_out(6,:) = [Bg*ones(1,12) Ss Ss Ar*ones(1,8) Sz Sz Ar Sz Ar*ones(1,5) Sz*ones(1,10)];
Sim_out(7,:) = [Bg*ones(1,11) Ss Ss Ss Ar*ones(1,8) Sz*ones(1,4) Ar Ar Sz*ones(1,13)];
Sim_out(8,:) = [Bg*ones(1,8) Ss Bg Ss*ones(1,4) Ar*ones(1,7) Sz*ones(1,20)];
Sim_out(9,:) = [Bg*ones(1,7) Ss Ss Bg Ss*ones(1,4) Ar*ones(1,7) Sz*ones(1,20)];

    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 8.2;                % cms
    fig_height = 5;                 % cms
    fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\Images\Images\fig';              % default directory for figure files
    fig_name = 'FR2PSPKernel.fig';
    fig_dirandname = [fig_dirname fig_name];
    colorbar_font = 6;
    % Plot 
    % ~~~~~~~~~~~~~~~~~~~~~

    figure('name','JRSim_Results',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    [c,h] = contourf(B_values,A_values,Sim_out,[1,Bg:0.5:Sz]);
    set(gca,'fontsize',tick_fontsize)
    xlabel('B (mV)','fontsize',label_fontsize)
    ylabel('A (mV)','fontsize',label_fontsize) 
     a= colorbar('YTickLabel',{'BG','SS','AR','SZ'});
%     a= colorbar('SouthOutside','XTickLabel',{'Background','Sporadic
%     Spiking',' Alpha Rhythms','Seizure',});
    set(a,'fontsize',colorbar_font);
%     b= get(a,'Position')
%     set(a,'Position',b);
    box off;
    print(gcf, '-dpdf', '-r600', ['Jansen_Sim_results.pdf'])