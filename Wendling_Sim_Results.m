% script created by Richard Balson 25/11/2012

% description
% ~~~~~~~~~~~
% This script produces a contour plot of the results from the Wendling Model

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
DB = 9; % Number of different values for B
DG =9;% Number of different values for G

Max_A =7;% Specify maximum value for A
Min_A =3; % Specify minimum value for A

Max_B = 40;% Specify maximum value for B
Min_B=0;% Specify minimum value for B

Max_G = 40; %Specify maximum value for G
Min_G =0; %Specify minimum value for G

% Bg =1; % Specify simulation value for background iEEG
% Ss =2;  % Specify simulation value for sporadic spiking iEEG
% Sd =3; % Specify simulation value for sustained discharge of spiking iEEG
% Sr=4; % Specify simulation value for slow rhythmic iEEG
% Lvr =5; %Specify simulation value for low volatage rapid iEEG
% Qs = 6; %Specify simulation value for quasi sinusoidal iEEG

Bg =1; % Specify simulation value for background iEEG
Ss =1.5;  % Specify simulation value for sporadic spiking iEEG
Sd =2; % Specify simulation value for sustained discharge of spiking iEEG
Sr=2.5; % Specify simulation value for slow rhythmic iEEG
Lvr =3; %Specify simulation value for low volatage rapid iEEG
Qs = 3.5; %Specify simulation value for quasi sinusoidal iEEG

% Static Varaibles
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A_values = linspace(Min_A,Max_A,DA); % Specify all values for A

B_values = linspace(Min_B,Max_B,DB); % Specify all values for B

G_values = linspace(Min_G,Max_G,DG); % Specify all values for G

% Simulation Results
% ~~~~~~~~~~~~~~~~~~~~~
% A=3

Sim_out(1,:,1) = [Bg*ones(1,5) Sr Sr Sr Bg]; % Results for B=0
Sim_out(2,:,1) = [Bg*ones(1,5) Sr Sr Bg Bg]; % Results for B=5
Sim_out(3,:,1) = [Sd Bg Sd Sd Sd Bg*ones(1,4)]; % Results for B=10
Sim_out(4,:,1) = [Sd Bg*ones(1,8)]; % Results for B=15
Sim_out(5,:,1) = [Bg Sd Bg*ones(1,7)]; % Results for B=20
Sim_out(6,:,1) = [Bg*ones(1,9)]; % Results for B=25
Sim_out(7,:,1) = [Bg*ones(1,9)]; % Results for B=30
Sim_out(8,:,1) = [Bg*ones(1,9)]; % Results for B=35
Sim_out(9,:,1) = [Bg*ones(1,9)]; % Results for B=40

% A =3.5

Sim_out(1,:,2) = [Bg*ones(1,4) Sr*ones(1,5)]; % Results for B=0
Sim_out(2,:,2) = [Bg*ones(1,4) Sr*ones(1,5)]; % Results for B=5
Sim_out(3,:,2) = [Ss*ones(1,4) Sr Ss Sr Ss Sr]; % Results for B=10
Sim_out(4,:,2) = [Ss*ones(1,8) Bg]; % Results for B=15
Sim_out(5,:,2) = [Bg Sd Bg*ones(1,7)]; % Results for B=20
Sim_out(6,:,2) = [Bg*ones(1,9)]; % Results for B=25
Sim_out(7,:,2) = [Bg*ones(1,9)]; % Results for B=30
Sim_out(8,:,2) = [Bg*ones(1,9)]; % Results for B=35
Sim_out(9,:,2) = [Bg*ones(1,9)]; % Results for B=40

% A =4

Sim_out(1,:,3) = [Bg Bg Sr*ones(1,7)]; % Results for B=0
Sim_out(2,:,3) = [Bg Bg Bg Sr*ones(1,6)]; % Results for B=5
Sim_out(3,:,3) = [Qs Qs Ss*ones(1,7)]; % Results for B=10
Sim_out(4,:,3) = [Qs Qs Qs Sd Ss Sd Ss Ss Ss]; % Results for B=15
Sim_out(5,:,3) = [Sd Ss Ss Sd Ss*ones(1,5)]; % Results for B=20
Sim_out(6,:,3) = [Ss*ones(1,4) Bg Bg Bg Ss Bg]; % Results for B=25
Sim_out(7,:,3) = [Bg*ones(1,9)]; % Results for B=30
Sim_out(8,:,3) = [Bg*ones(1,9)]; % Results for B=35
Sim_out(9,:,3) = [Bg*ones(1,9)]; % Results for B=40


% A=4.5

Sim_out(1,:,4) = [Bg Bg Bg Sr*ones(1,6)]; % Results for B=0
Sim_out(2,:,4) = [Bg Bg Bg Sr*ones(1,6)]; % Results for B=5
Sim_out(3,:,4) = [Sd Sd Sd Lvr*ones(1,6)]; % Results for B=10
Sim_out(4,:,4) = [Sd*ones(1,9)]; % Results for B=15
Sim_out(5,:,4) = [Sd*ones(1,9)]; % Results for B=20
Sim_out(6,:,4) = [Ss Ss Sd Ss*ones(1,4) Sd Sd]; % Results for B=25
Sim_out(7,:,4) = [Ss Ss Bg Ss Ss Ss Bg Ss Ss]; % Results for B=30
Sim_out(8,:,4) = [Ss Ss Bg Ss Ss Bg Ss Ss Bg]; % Results for B=35
Sim_out(9,:,4) = [Bg*ones(1,5) Ss Bg Ss Bg]; % Results for B=40

% A =5

Sim_out(1,:,5) = [Bg Bg Bg Sr*ones(1,6)]; % Results for B=0
Sim_out(2,:,5) = [Bg Bg Bg Sr*ones(1,6)]; % Results for B=5
Sim_out(3,:,5) = [Qs Qs Sd Sd Lvr*ones(1,5)]; % Results for B=10
Sim_out(4,:,5) = [Qs*ones(1,4) Sd Qs Sd Sd Sd]; % Results for B=15
Sim_out(5,:,5) = [Qs*ones(1,4) Sd Sd Qs Qs Sd]; % Results for B=20
Sim_out(6,:,5) = [Sd Sd Qs Sd Sd Sd Ss Sd Qs]; % Results for B=25
Sim_out(7,:,5) = [Sd Sd Ss Sd Ss Ss Ss Sd Ss]; % Results for B=30
Sim_out(8,:,5) = [Ss Sd Ss*ones(1,7)]; % Results for B=35
Sim_out(9,:,5) = [Sd Bg Ss*ones(1,7)]; % Results for B=40

% A =5.5

Sim_out(1,:,6) = [Bg*ones(1,4) Sr*ones(1,5)]; % Results for B=0
Sim_out(2,:,6) = [Bg*ones(1,4) Sr*ones(1,5)]; % Results for B=5
Sim_out(3,:,6) = [Qs Qs Sd Sd Sd Lvr*ones(1,4)]; % Results for B=10
Sim_out(4,:,6) = [Qs Qs Qs Sd Qs Qs Qs Sd Qs]; % Results for B=15
Sim_out(5,:,6) = [Qs Qs Qs Sd Qs Qs Qs Sd Qs]; % Results for B=20
Sim_out(6,:,6) = [Sd*ones(1,4) Qs Sd*ones(1,4)]; % Results for B=25
Sim_out(7,:,6) = [Sd Ss Sd Ss Sd Sd Sd Ss Sd]; % Results for B=30
Sim_out(8,:,6) = [Ss Sd*ones(1,4) Ss Sd Ss Sd]; % Results for B=35
Sim_out(9,:,6) = [Ss*ones(1,9)]; % Results for B=40

% A=6

Sim_out(1,:,7) = [Bg*ones(1,4) Sr*ones(1,5)]; % Results for B=0
Sim_out(2,:,7) = [Bg*ones(1,4) Sr*ones(1,5)]; % Results for B=5
Sim_out(3,:,7) = [Qs Qs Qs Sd Lvr*ones(1,5)]; % Results for B=10
Sim_out(4,:,7) = [Qs Qs Qs Sd*ones(1,6)]; % Results for B=15
Sim_out(5,:,7) = [Qs Sd*ones(1,8)]; % Results for B=20
Sim_out(6,:,7) = [Sd*ones(1,9)]; % Results for B=25
Sim_out(7,:,7) = [Sd*ones(1,9)]; % Results for B=30
Sim_out(8,:,7) = [Sd Sd Ss Sd*ones(1,6)]; % Results for B=35
Sim_out(9,:,7) = [Sd Sd Ss Sd Sd Ss*ones(1,4)]; % Results for B=40

% A =6.5

Sim_out(1,:,8) = [Bg*ones(1,5) Sr*ones(1,4)]; % Results for B=0
Sim_out(2,:,8) = [Bg*ones(1,5) Sr*ones(1,4)]; % Results for B=5
Sim_out(3,:,8) = [Qs Qs Sd Sd Lvr*ones(1,5)]; % Results for B=10
Sim_out(4,:,8) = [Qs Qs Sd*ones(1,5) Qs Qs]; % Results for B=15
Sim_out(5,:,8) = [Qs Qs Qs Sd*ones(1,6)]; % Results for B=20
Sim_out(6,:,8) = [Sd*ones(1,9)]; % Results for B=25
Sim_out(7,:,8) = [Sd*ones(1,9)]; % Results for B=30
Sim_out(8,:,8) = [Sd*ones(1,9)]; % Results for B=35
Sim_out(9,:,8) = [Sd Sd Ss Ss Sd Sd Ss Sd Ss]; % Results for B=40

% A =7

Sim_out(1,:,9) = [Bg*ones(1,5) Sr*ones(1,4)]; % Results for B=0
Sim_out(2,:,9) = [Bg*ones(1,5) Sr*ones(1,4)]; % Results for B=5
Sim_out(3,:,9) = [Qs Qs Qs Lvr Sd Lvr*ones(1,4)]; % Results for B=10
Sim_out(4,:,9) = [Qs*ones(1,4) Sd Qs*ones(1,4)]; % Results for B=15
Sim_out(5,:,9) = [Qs Qs Qs Sd*ones(1,6)]; % Results for B=20
Sim_out(6,:,9) = [Sd*ones(1,9)]; % Results for B=25
Sim_out(7,:,9) = [Sd*ones(1,9)]; % Results for B=30
Sim_out(8,:,9) = [Sd*ones(1,9)]; % Results for B=35
Sim_out(9,:,9) = [Sd Ss Sd Sd Ss Ss Sd Sd Sd]; % Results for B=40

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
    
    % A =3
    
    for k = 1:DA
        
        A = A_values(k)*10;
    
        fig = figure('name',['WMSim_ResultsA_',int2str(A)],...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    [c,h] = contourf(G_values,B_values,Sim_out(:,:,k),[1,Bg:0.5:Qs]);
    set(gca,'fontsize',tick_fontsize)
    xlabel('G (mV)','fontsize',label_fontsize)
    ylabel('B (mV)','fontsize',label_fontsize)  
    a= colorbar('YTickLabel',{'BG','SS','SDS','SR','LVR','QS'});
    caxis([Bg Qs]);
%         set(a,'fontsize',colorbar_font);
%             b= get(a,'OuterPosition')
%     set(a,'OuterPosition',[b(1) b(2) b(3) 1*b(4)]);

%     b= get(a,'Position')
%     set(a,'Position',[b(1) b(2) b(3) 0.5*b(4)]);
%     b= get(fig,'Position')
%     set(fig,'Position',[b(1) b(2) b(3) 0.9*b(4)])

    title(['A=',num2str(A_values(k))],'fontsize',label_fontsize);
    box off;
    print(gcf, '-dpdf', '-r600', ['Wendling_Sim_A_',int2str(A),'.pdf'])
    
    colorM = [0 0 1; 0 0.5 0.5; 0 1 0; 0.5 0.5 0; 1 0 0; 1 1 1]
    
    end

