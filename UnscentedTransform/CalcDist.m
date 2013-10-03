function [Distribution,xT,yT] = CalcDist(X,Pxx,States,discrete)


range = 4*Pxx;
if States ==2
[xT,yT] = meshgrid((X(1)-range(1,1)):discrete(1):(X(1)+range(1,1)),(X(2)-range(2,2)):discrete(2):(X(2)+range(2,2)));
Dpoints =[xT(:) yT(:)]';
else
    Dpoints = (X-range):0.1:(X+range);
end

points = size(Dpoints,2);
meanf = X'*ones(1,points);

%

%%%multivar Gassiaan
Gauss_Scale = 1/((2*pi)^States*det(Pxx)); 
Exponent = (Dpoints-meanf)'/Pxx*(Dpoints-meanf);
Distribution= Gauss_Scale^(0.5)*exp(-0.5.*Exponent);