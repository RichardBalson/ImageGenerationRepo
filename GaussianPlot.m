% script created by Richard Balson 19/10/2012

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

function [x y] = GaussianPlot(mean,variance)

std_deviation = sqrt(variance);
sigmalength = 4;
sigmatotal = sigmalength*std_deviation*2;
number_of_loops =500;

for m = 1:number_of_loops
    x(m) = (m-number_of_loops/2)*sigmatotal/number_of_loops+mean;
    y(m) = 1/(std_deviation*sqrt(2*pi))*exp(-.5/variance*((x(m)-mean)^2));
end

% Units
% ~~~~~~~~

% Equations
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% End of function description