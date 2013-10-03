
Base_folder = '..\..\..\..\Estimation\UKF\UKFFinal\Seizure DATA\130309P150\';
FileName = [Base_folder,'Animal5Seizure1Channel2.mat'];
Padding = 150;
fs = 2048;

load(FileName,'Data_out');

Data = Data_out;

clear Data_out

% Simulated Seizure data

Base_folder = '..\..\..\..\Estimation\UKF\UKFFinal\Wendling\EstimateDataWendling\ParameterEstimation\130309J\';

Parameters=[Base_folder,'A5S1C2\ModelStates.mat'];

load(Parameters,'X');

DataSim = Wendling_Sim(X(9:end,:),fs);
clear X
DataSim = DataSim(3:end);