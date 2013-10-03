% Stationery Parameter defintions
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Model parameters
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Units seconds^(-1)
% ~~~~~~~~~~~~

sampling_frequency = 2048;

tcon =[100 50];             %Excitatory time constant

gain = [5; 20]; %Specifiy initial parameter values for simulations

dt = 1/sampling_frequency; % Time step between solutions
