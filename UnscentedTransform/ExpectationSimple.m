% script created by Richard Balson 06/09/2012

% description
% ~~~~~~~~~~~
% This function describes tthe calculation of expected values and covariances using sigma
% points ( Note variances that are described initailly may ned to be added
% to the variances determined using this fucntion

% last edit
% ~~~~~~~~~

% next edit
% ~~~~~~~~~

% Beginning of function
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function [ExpX PxxF] = ExpectationSimple(X, Dx,kappa)

if nargin == 4
    kappa =0;
end

% Determine element weights
% ~~~~~~~~~~~~~~~~~~~~~~~~~
if kappa > 0
    Weights = [kappa/(Dx+kappa) ones(1,size(X,2)-1)*1/(2*(kappa+Dx))];
    Number_sigma = 2*Dx+1;
else
    Weights = ones(1,size(X,2))*1/(2*(kappa+Dx));
    Number_sigma = 2*Dx;
end

% Determine the expected value for states and output
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~

if size(X,1) == Dx         % Determine how x matrix orientated
    ExpX= sum(bsxfun(@times,X',Weights'))';
else
    ExpX = sum(bsxfun(@times,X,Weights'))';
end


for i = 1:length(ExpX)
    if size(X,1) == Dx          % Determine how X matrix orientated
        Px(i,:) =  X(i,:) -ExpX(i);
    else 
        Px(i,:) = X(:,i)' - ExpX(i);
    end
end


PxxF = bsxfun(@times,Px,Weights)*Px';




