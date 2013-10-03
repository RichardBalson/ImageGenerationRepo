function [X Data_out] = CollateData(DataFilenames,StateFilenames,j)

    if j ==1
    load(DataFilenames{j},'Data_out');
    else
        Data_out=0;
    end
    load(StateFilenames{j},'X');


