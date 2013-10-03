% script created by Richard Balson 05/11/2012

% description
% ~~~~~~~~~~~
% This function shows the propogation of sigma points through a sigmoid
% function

% last edit
% ~~~~~~~~~

% next edit
% ~~~~~~~~~

% Beginning of function
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function [x y] = SigmaPropagation(meanin,variance)

% Determine Gussian structure and Sigma Points
% ~~~~~~~~~~~~~~~~~~

std_deviation = sqrt(variance);
sigmalength = 4;
sigmatotal = sigmalength*std_deviation*2;
number_of_loops =500;

for m = 1:number_of_loops
    x(m) = (m-number_of_loops/2)*sigmatotal/number_of_loops+meanin;
    y(m) = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((x(m)-meanin)^2));
end

% Sigma Points
% ~~~~~~~~~~~~~~

Sigmax = [meanin-std_deviation meanin+std_deviation meanin];

for k = 1:length(Sigmax)
SigmaY(k) = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((Sigmax(k)-meanin)^2));
end

% Propagate gaussian distribution through sigmoid function
% ~~~~~~~~~~~~~~~

for m = 1:number_of_loops
Sout(m) = 5/(1+exp(0.56*(6-x(m))));
end


MeanParticle = mean(Sout);
varParticle = var(Sout);
stddevParticle = sqrt(varParticle);

for m = 1:number_of_loops
    Sxout(m) = (m-number_of_loops/2)*sigmatotal/number_of_loops+MeanParticle;
    SPout(m) = 1/(stddevParticle*sqrt(2*pi))*exp(-.5/varParticle*((Sxout(m)-MeanParticle)^2));
end

% Propagate sigma points through sigmoid function
% ~~~~~~~~~~~~~~


for k = 1:length(Sigmax)
Sigmaout(k) = 5/(1+exp(0.56*(6-Sigmax(k))));
end




% Determine varaince and mean of propagated states
% ~~~~~~~~~~~~~~~~

MeanGauss = mean(Sigmaout);
varGauss = var(Sigmaout);
stddevGauss = sqrt(varGauss);

for m = 1:number_of_loops
    xout(m) = (m-number_of_loops/2)*sigmatotal/number_of_loops+MeanGauss;
    yout(m) = 1/(stddevGauss*sqrt(2*pi))*exp(-.5/varGauss*((xout(m)-MeanGauss)^2));
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

    figure('name','Sigma Point Propagation',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width fig_height],...
        'papersize',[fig_width fig_height],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    subplot(2,2,1),plot(y,x,'k');
    hold on
    plot(SigmaY(3),Sigmax(3),'or-');
    hold on
    plot(SigmaY(1),Sigmax(1),'ob-');
    hold on
    plot(SigmaY(2),Sigmax(2),'ob-')
    set(gca,'fontsize',tick_fontsize)
    xlabel('Probability','fontsize',label_fontsize)
    ylabel('State Value','fontsize',label_fontsize)
    title('State Distribution','fontsize',label_fontsize);
    box off;
    axis([min(y) max(y)+0.1 min(x) max(x)+0.1]);
    
%  plot Sigmoid function
%  ~~~~~~~~~~~~~~~
    
    subplot(2,2,2),plot(x,Sout,'k');
    set(gca,'fontsize',tick_fontsize)
    xlabel('Membrane Potential','fontsize',label_fontsize)
    ylabel('Firing Rate','fontsize',label_fontsize)
    title('Sigmoid Function','fontsize',label_fontsize);
    box off;
    axis([min(x) max(x) min(Sout) max(Sout)+0.1]);
 
    
    % Plot updated state distribution
    % ~~~~~~~~~~~~~~~~~~~~~

    subplot(2,2,3),plot(Sxout,SPout,'k');
    set(gca,'fontsize',tick_fontsize)
    xlabel('State Value','fontsize',label_fontsize)
    ylabel('Probability','fontsize',label_fontsize)
    title('Updated State Distribution','fontsize',label_fontsize);
    box off;
    axis([min(Sxout) max(Sxout) min(SPout) max(SPout)+0.1]);
    
    % Plot estimated updated state distribution
    % ~~~~~~~~~~~~~~~~~~~~~

    subplot(2,2,4),plot(xout,yout,'k');
    set(gca,'fontsize',tick_fontsize)
    xlabel('State Value','fontsize',label_fontsize)
    ylabel('Probability','fontsize',label_fontsize)
    title('Estimated State Distribution','fontsize',label_fontsize);
    box off;
    axis([min(xout) max(xout) min(yout) max(yout)+0.1]);
    print(gcf, '-dpdf', '-r600', ['Sigma_Points_Propagation_and_Particle_Filter_Propagation_Sigmoid_Mean_',int2str(meanin),'_Variance_',int2str(variance),'.pdf'])

   % Plot of distribution results from particle and unscented transforms 
    
        figure('name','Sigma Point Propagation Error',...
        'units','centimeters',...
        'position',[fig_left_pos fig_bottom_pos fig_width/2 fig_height/2],...
        'papersize',[fig_width/2 fig_height/2],...
        'filename',fig_dirandname,...
        'PaperPositionMode','auto')
    plot(xout,yout,'k');
    hold on
    plot(Sxout,SPout,'r');
    set(gca,'fontsize',tick_fontsize)
    xlabel('State Value','fontsize',label_fontsize)
    ylabel('Probability','fontsize',label_fontsize)
    title('State Distribution','fontsize',label_fontsize);
    box off;
%     axis([min(Sxout) max(Sxout)+0.1 min(out) max(SPout)+0.1]);
    print(gcf, '-dpdf', '-r600', ['Sigma_Points_Propagation_Error_and_Particle_Filter_Propagation_Sigmoid_Mean_',int2str(meanin),'_Variance_',int2str(variance),'.pdf'])
% Units
% ~~~~~~~~

% Equations
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% End of function description