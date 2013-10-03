function Gauss2dTest(mean,cov)

% Figure out how to plot sigma points for two dimensional plot, look at
% unscented transfom from estimation work
close all
clc
%Gauss2dTest([1 3],[1,1;1 2]);
kappa =0.5;
figureSettings;
k = length(mean); 

discrete = diag(cov)/5;

if k >2 
    disp('Cannot plot more than two dimensions');
    return
end
[GaussDist,xT,yT] = CalcDist(mean,cov,k,discrete);

Cont = figure('name',fig_settings.name,...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
 SigmaP = Unscented_transform(k,cov,mean,kappa);
if k ==2
    Data = reshape(diag(GaussDist),size(xT,1),size(xT,2));
    contour(xT(1,:),yT(:,1),Data)
    hold on
    stdev = chol(cov);
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'r*');
        elseif ((kappa ==0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'b*');
        else
            plot(SigmaP(1,j),SigmaP(2,j),'b*');
        end
    end
    axis([min(xT(1,:))+1.5 max(xT(1,:))-1.5 min(yT(:,1))+4 max(yT(:,1))-4]); 
        axis off
    box off
    MeshP= figure('name',[fig_settings.name 'Mesh'],...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
    mesh(xT(1,:),yT(:,1),Data)
    hold on
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','r');
        elseif ((kappa ==0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','b');
        else
            line([SigmaP(1,j) SigmaP(1,j)],[SigmaP(2,j) SigmaP(2,j)],[0,max(max(Data))*1.2],'color','b');
        end
    end

    SurfP =figure('name',[fig_settings.name 'Surf'],...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
    surf(xT(1,:),yT(:,1),Data)
        hold on
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','r');
        elseif ((kappa ==0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','b');
        else
            line([SigmaP(1,j) SigmaP(1,j)],[SigmaP(2,j) SigmaP(2,j)],[0,max(max(Data))*1.2],'color','b');
        end
    end
else
    Data = diag(GaussDist);
    plot(x(1,:),Data,'k')
    hold on
    [~,loc] = min(delta,[],2);
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'r*');
        elseif ((kappa ==0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'b*');
        else
            plot(SigmaP(1,j),SigmaP(2,j),'b*');
        end
    end
    xlabel('State 1','fontsize',fig_settings.label_fontsize)
    ylabel('State Probability','fontsize',fig_settings.label_fontsize);
    axis off
    box off
end


% Model Propagation

WendlingModelStationaryParameters;
SigmaP= Simple_model(SigmaP,dt, gain, tcon);
[ExpX PxxF] = ExpectationSimple(SigmaP, k,kappa)
discrete = diag(PxxF)/8;
[GaussDist,xT,yT] = CalcDist(ExpX',PxxF,k,discrete);



% Plot results for propogated data

ContProp = figure('name',fig_settings.name,...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
if k ==2
    Data = reshape(diag(GaussDist),size(xT,1),size(xT,2));
    contour(xT(1,:),yT(:,1),Data)
    hold on
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'r*');
        elseif ((kappa ==0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'b*');
        else
            plot(SigmaP(1,j),SigmaP(2,j),'b*');
        end
    end
        axis off
    box off
    MeshProp= figure('name',[fig_settings.name 'Mesh'],...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
    mesh(xT(1,:),yT(:,1),Data)
    hold on
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','r');
        elseif ((kappa ==0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','b');
        else
            line([SigmaP(1,j) SigmaP(1,j)],[SigmaP(2,j) SigmaP(2,j)],[0,max(max(Data))*1.2],'color','b');
        end
    end
        axis off
    box off
    SurfProp =figure('name',[fig_settings.name 'Surf'],...
    'units','centimeters',...
    'position',[fig_settings.left_pos fig_settings.bottom_pos fig_width fig_height],...
    'papersize',[fig_width fig_height],...
    'filename',fig_dirandname,...
    'PaperPositionMode','auto');
    surf(xT(1,:),yT(:,1),Data)
        hold on
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','r');
        elseif ((kappa ==0) && (j ==1))
            line([SigmaP(1,1) SigmaP(1,1)],[SigmaP(2,1) SigmaP(2,1)],[0,max(max(Data))*1.2],'color','b');
        else
            line([SigmaP(1,j) SigmaP(1,j)],[SigmaP(2,j) SigmaP(2,j)],[0,max(max(Data))*1.2],'color','b');
        end
    end
else
Data = diag(GaussDist);
    plot(x(1,:),Data,'k')
    hold on
    [~,loc] = min(delta,[],2);
    for j = 1:size(SigmaP,2)
        if ((kappa >0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'r*');
        elseif ((kappa ==0) && (j ==1))
            plot(SigmaP(1,1),SigmaP(2,1),'b*');
        else
            plot(SigmaP(1,j),SigmaP(2,j),'b*');
        end
    end
    xlabel('State 1','fontsize',fig_settings.label_fontsize)
    ylabel('State Probability','fontsize',fig_settings.label_fontsize);
        axis off
    box off
end

saveas(Cont,'OrigDistContour.fig','fig');
          
print(Cont, '-dpdf','-painters', '-r2400', 'OrigDistContour.pdf');

saveas(ContProp,'UnscentedTransformR.fig','fig');
          
print(ContProp, '-dpdf','-painters', '-r2400', 'UnscentedTransformR.pdf');