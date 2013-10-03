% script created by Richard Balson 05/11/2012

% description
% ~~~~~~~~~~~
% This function determines the values for  gaussian distribution given a
% specified mean and variance

% last edit
% ~~~~~~~~~

% next edit
% ~~~~~~~~~

% Beginning of function
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function [x y] = GaussianPlot_SigmaPoints(mean,variance)

std_deviation = sqrt(variance);
sigmalength = 4;
sigmatotal = sigmalength*std_deviation*2;
number_of_loops =500;

for m = 1:number_of_loops
    x(m) = (m-number_of_loops/2)*sigmatotal/number_of_loops+mean;
    y(m) = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((x(m)-mean)^2));
end

Smean = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((mean-mean)^2));
Sigma1 = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((mean-std_deviation-mean)^2));
Sigma2 = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((mean+std_deviation-mean)^2));

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

    % Plot 
    % ~~~~~~~~~~~~~~~~~~~~~

    figure('name','FR2PSPKernel',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    plot(x,y,'k');
    hold on
    plot(mean,Smean,'or-');
    hold on
    plot(mean-std_deviation,Sigma1,'ob-');
    hold on
    plot(mean+std_deviation,Sigma2,'ob-')
    set(gca,'fontsize',tick_fontsize)
    xlabel('State Value','fontsize',label_fontsize)
    ylabel('Probability','fontsize',label_fontsize)
%     title('Sigma Points','fontsize',label_fontsize);
    box off;
    axis([min(x) max(x) min(y) max(y)+0.1]);
    print(gcf, '-dpdf', '-r600', ['Sigma_Points_Mean_',int2str(mean),'_Variance_',int2str(variance),'.pdf'])

% Units
% ~~~~~~~~

% Equations
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% End of function description