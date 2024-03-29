% script created by Richard Balson 06/09/2012

% description
% ~~~~~~~~~~~
% This function describes the unscented transform

% last edit
% ~~~~~~~~~
% kappa added to unscented transorm, matrix order of Pxx altered to account
% for low standard deviation in state 1
% next edit
% ~~~~~~~~~

% Beginning of function
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function [SigmaF, err] = Unscented_transform(Dx,Pxx,X,kappa)

if nargin ==3
    kappa =0;
end

err=0; % Set error to zero
symetric = (Pxx+Pxx')/2; % Make sure matrix is symmetric
[sigma_root, p] = chol((Dx+kappa)*symetric); % Define sigma points variation from the mean value
if p >0
    SigmaF =0;
    err =1;
    disp('Error cholesky squatre root could not be performed');
    return
end

%Sigma points calculation
% ~~~~~~~~~~~~~~~~~~~~
sigma_root = sigma_root';
if size(X,1)<size(X,2)
    X = X';
end
% sigma_root = sigma_root(end:-1:1,end:-1:1);
Sigma =  X*ones(1,2*Dx)+[sigma_root, -sigma_root];
 if kappa >0
     Sigma0 = X;
 else 
     Sigma0 = [];
 end
 SigmaF = cat(2,Sigma0,Sigma);