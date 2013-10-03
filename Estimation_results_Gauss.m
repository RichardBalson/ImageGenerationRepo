% script created by Richard Balson 25/04/2012

% description
% ~~~~~~~~~~~
% This function shows the propogation of sigma points through a sigmoid
% function

% last edit
% ~~~~~~~~~

% next edit
% ~~~~~~~~~
% Determine varaince and mean of propagated states
% ~~~~~~~~~~~~~~~~

clear all
close all
clc

load GaussEstimationExpectInit1 MeanStates

Number_of_points = 1000;
sigmalength = 5;
Actual = [90 5 20 20];

Means = mean(MeanStates(:,9:12),1);
Stdev = std(MeanStates(:,9:12),1);

% MeanInp = mean(MeanStates(:,9));
% MeanExc = mean(MeanStates(:,10));
% MeanSInh = mean(MeanStates(:,11));
% MeanFInh
% varGauss = var(Sigmaout);
% stddevGauss = sqrt(varGauss);

xout = zeros(4, Number_of_points);
yout = zeros(4, Number_of_points);
for k = 1:4
for m = 1:Number_of_points
    xout(k,m) = (m-Number_of_points/2)*sigmalength*Stdev(k)*2/Number_of_points+Means(k);
    yout(k,m) = 1/(Stdev(k)*sqrt(2*pi))*exp(-.5/(Stdev(k)^2)*(xout(k,m)-Means(k))^2);
end
end




    % defines bits for plotting
    % ~~~~~~~~~~~~~~~~~~~~~~~~~
    label_fontsize = 10;            % point
    tick_fontsize = 8;              % point
    fig_left_pos = 5;               % cms
    fig_bottom_pos = 5;             % cms
    fig_width = 8.2*2;                % cms
    fig_height = 5*2;                 % cms
    fig_dirname = 'C:\Users\Richard\Desktop\PhD\Projects\Images\Images\fig';              % default directory for figure files
    fig_name = 'FR2PSPKernel.fig';
    fig_dirandname = [fig_dirname fig_name];

    % Plot original state distribution
    % ~~~~~~~~~~~~~~~~~~~~~
    colorP = ['k' 'k' 'k' 'k'];
    Names ={'Input mean' '\theta_{p}' '\theta_{si}' '\theta_{fi}'};
    NamesS = {'Input_mean' 'Excitatory_Gain' 'Slow_Inhibitory_Gain' 'Fast_Inhibitory_Gain'};
  for k = 1:4
    figure('name',Names{k},...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    fill(xout(k,:),yout(k,:),colorP(k))
    ylabel('Probability Density','fontsize',label_fontsize)
    xlabel(Names{k},'fontsize',label_fontsize)
%     title('State Distribution','fontsize',label_fontsize);
    box off;
    axis([min(xout(k,:))-Stdev(k) max(xout(k,:))+Stdev(k) min(yout(k,:)) max(yout(k,:))+0.01]);
    yL = get(gca,'YLim');
    line([Actual(k) Actual(k)],yL,'Color','r');
    line([Means(k)-Stdev(k) Means(k)-Stdev(k)],yL,'Color','b');
    line([Means(k)+Stdev(k) Means(k)+Stdev(k)],yL,'Color','b');
    print(gcf, '-dpdf', '-r600', ['Estimation_Results_Multiple_Simulations_Gaussian_Dist',NamesS{k},'.pdf'])
  end