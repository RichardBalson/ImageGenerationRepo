function [Distribution,Dpoints] = CalcDist(X,Pxx,discrete)


range = 6*Pxx;

Dpoints = (X-range):0.1:(X+range);

points = size(Dpoints,2);
meanf = X'*ones(1,points);

%

%%%multivar Gassiaan
Gauss_Scale = 1/((2*pi)*det(Pxx)); 
Exponent = (Dpoints-meanf)'/Pxx*(Dpoints-meanf);
Data= Gauss_Scale^(0.5)*exp(-0.5.*Exponent);

Distribution = reshape(diag(Data),size(Dpoints,1),size(Dpoints,2));
