function [X Data_out] = CollateData(StateFilenames,j,fs)


    load(StateFilenames{j},'X');
    
    DataSim = Wendling_Sim(X(9:end,:),fs);
    Data_out = DataSim(3:end);



