 % script created by Richard Balson 14/10/2012

% description
% ~~~~~~~~~~~
% This function describes the Wendling neural mass model with 8 differential equations and its
% observation function, the simplified version

% last edit
% ~~~~~~~~~

% Yout function defined correctly

% next edit
% ~~~~~~~~~

% Beginning of function
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function [Xout Yout] = Simple_model(Xin,dt, gain, tcon)
Xout = Xin;
zs1 =  Xin(1,:);
[Xout(1,:) Yout] = PSPkernel([Xin(1,:); Xin(2,:)],dt,gain(1,:),tcon(1),sigmoid(zs1));
if size(Xin,1)>2
zs2 = Xin(2,:);
[Xout(2,:) Yout] = PSPkernel([Xin(2,:); Xin(1,:)],dt,gain(2,:),tcon(2),sigmoid(zs2));
end
% Observation function
Xout = sin(Xout);
end

% Parameter specifiction
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% Units
% ~~~~~~~~

% Equations
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% End of function description    


