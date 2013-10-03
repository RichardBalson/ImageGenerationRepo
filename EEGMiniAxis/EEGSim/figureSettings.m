% script created by Richard Balson 12/09/2013

% description
% ~~~~~~~~~~~

% This script specifies the setting for an EEG trace and its model
% parameters

% last edit
% ~~~~~~~~~
  %set(h,'Color','none') Make axis h transparent
  %> set(h,'Ticklength',[0 0]) % remove ticks for axis

% next edit
% ~~~~~~~~~

% Beginning of script
% ~~~~~~~~~~~~~~~~~~~~~
fig_settings.name ='Recorded Seizure Data';
fig_settings.Simname = 'Simulated Seizure Data';
fig_settings.label_fontsize = 10;            % point
fig_settings.tick_fontsize = 8;              % point
fig_settings.legend_fontsize = 8;
fig_settings.left_pos = 5;               % cms
fig_settings.bottom_pos = 5;             % cms
fig_settings.font_type = 'Arial';
fig_settings.dirname = 'Results';              % default directory for figure files
fig_settings.scale =0.1;
fig_settings.Sscale =0;
fig_dirandname = [fig_settings.dirname fig_settings.name];

axis_place = [0.15 0.2];
Saxis_place =[0.3 0.2];
Num_ticks =3;
Number_of_states =4;
State_order = [10 11 12 9];
State_names = {'G_{p} (mV)' 'G_{si} (mV)' 'G_{fi} (mV)' 'Input (Hz)'};



fig_width = 7.5;     %Plos full page figure with two columns           % cms
fig_height = 3.5;    %Plos full page figure with two rows             % cms
% fig_dirandname = [fig_settings.dirname name];
legLoc= [0.4 0.75 0.2 0.4];
legOri = 'horizontal';

if ~isempty(ZoomFig)
    Figures = size(ZoomFig,2);
    Zoom_colors =['r' 'g' 'b'];
    Zoom_axis_place = [0.15 0.2];
    Zoom_axis_place_Z = [0.6 0.8];
    zoom_fig_width = fig_width/Figures;     %Plos full page figure with two columns           % cms
    zoom_fig_height = fig_height/2; 
end
