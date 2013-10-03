function Gauss2d(mean,cov)

k = length(mean); 
if k >2 
    disp('Cannot plot more than two dimensions');
    return
end
if k ==2
[xT,yT] = meshgrid(-10:0.5:10,-10:0.5:10);
x =[xT(:) yT(:)]';
else
    x = -10:0.1:10;
end

points = size(x,2);
meanf = mean'*ones(1,points);

%

%%%multivar Gassiaan
Gauss_Scale = 1/((2*pi)^k*det(cov)); 
Exponent = (x-meanf)'/cov*(x-meanf);
GaussDist= Gauss_Scale^(0.5)*exp(-0.5.*Exponent);

figure(1)
if k ==2
    Data = reshape(diag(GaussDist),sqrt(points),sqrt(points));
    mesh(xT(1,:),yT(:,1),Data)
    figure(2)
    contour(xT(1,:),yT(:,1),Data)
    figure(3)
    surf(xT(1,:),yT(:,1),Data)
else
    Data = diag(GaussDist);
    plot(x(1,:),Data)

end

%plot3(x1(1,:),x1(2,:),diag(mulGau))