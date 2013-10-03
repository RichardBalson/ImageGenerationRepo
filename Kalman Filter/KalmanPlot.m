function KalmanPlot(X,Pxx,Y,Pyy,Pxy)
% KalmanPlot(1,3,5,4,2);
close all
clc

figureSettings;
discrete = Pxx/5;
[GaussDist, x] = CalcDist(X,Pxx,discrete);
KPlot= figure('name',fig_settings.name,...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
    plot(x(1,:),GaussDist,'k')
    hold on
    xlabel('State','fontsize',fig_settings.label_fontsize)
    ylabel('Probability','fontsize',fig_settings.label_fontsize);
    box off
    
    discrete = Pyy/5;
[GaussDist, x] = CalcDist(Y,Pyy,discrete);
plot(x(1,:),GaussDist,'b')
[Xest Pxxest] = Kalman(X,X,Y,Pxx,Pxy,Pyy);

    discrete = Pxxest/5;
[GaussDist, x] = CalcDist(Xest,Pxxest,discrete);
plot(x(1,:),GaussDist,'r')


    legend('Prior','Obs.','Posterior');
    set(gca,'fontsize',fig_settings.tick_fontsize)
    k=legend('Location',legLoc,'Orientation',legOri);
    legend(k,'boxoff');
    set([k gca],'FontName',fig_settings.font_type,'fontsize',fig_settings.legend_fontsize);
    f = findobj('type', 'line');
    set(f(2), 'XData', [.2, .4]); % Changes line three
    set(f(4), 'XData', [.2, .4]); % Changes line two
    set(f(6), 'XData', [.2, .4]); % Changes line one
    
saveas(KPlot,'KalmanFilter.fig','fig');
          
print(KPlot, '-dpdf','-painters', '-r2400', 'KalmanFilter.pdf');
