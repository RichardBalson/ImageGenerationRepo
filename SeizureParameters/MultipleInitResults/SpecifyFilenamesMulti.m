% script created by Richard Balson 12/09/2013

% description
% ~~~~~~~~~~~

% This script specifies the setting for an EEG trace and its model
% parameters

% last edit
% ~~~~~~~~~


% next edit
% ~~~~~~~~~

% Beginning of script
% ~~~~~~~~~~~~~~~~~~~~~
% Base_folder = '..\..\..\Estimation\UKF\UKFFinal\Seizure DATA\130309P150\';
% 
% Datafilenames = {[Base_folder,'Animal6Seizure1Channel2.mat']}; % Specify full directory of required mat file for seizure plot;
                    
Base_folder = '..\..\..\..\Estimation\UKF\UKFFinal\Wendling\EstimateDataWendling\ParameterEstimation\';
                    
StatesFilename = {[Base_folder,'130309J\A5S1C2\MultiModelStates.mat']};

Decimate = 100;
              
                          