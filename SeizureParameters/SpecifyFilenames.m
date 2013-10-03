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
Base_folder = '..\..\..\Estimation\UKF\UKFFinal\Seizure DATA\270713P150\';

Datafilenames = {[Base_folder,'Animal7Seizure3Channel2.mat']}; % Specify full directory of required mat file for seizure plot;
                    
Base_folder = '..\..\..\Estimation\UKF\UKFFinal\Wendling\EstimateDataWendling\ParameterEstimation\130727J\';
                    
StatesFilename = {[Base_folder,'A7S3C2\ModelStates.mat'],...
                  [Base_folder,'A7S8C2\ModelStates.mat'],...
                  [Base_folder,'A7S9C2\ModelStates.mat'],...
                  [Base_folder,'A7S10C2\ModelStates.mat']};