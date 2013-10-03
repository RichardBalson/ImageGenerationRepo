function PlotEEG(ZoomFig)
% Function created  by Richard Balson 12/09/2013
% Data is a N*1 matrix specifying the EEg data of intereset, fs is the
% sampling frequency and padding is the padding prior to and post seizure
% for the data set. ZoomFig is a Z*2 matrix where Z is the number of zoomed
% in figures to generate and each row specifies the start and end point of
% the figure in time.

clc
close  all

PullFileData;

if nargin ==0
    ZoomFig =[];
end

figureSettings;

Samples = length(Data);
Duration = (Samples-1)/fs;

t = -Padding:1/fs:(Duration-Padding);
Seizure_end = Duration -2*Padding;

PlotRecordedData;

PlotSimulatedData;




