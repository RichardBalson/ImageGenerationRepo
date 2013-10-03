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
fig_settings.name ='Kalman plot';
fig_settings.label_fontsize = 8;            % point
fig_settings.tick_fontsize = 8;              % point
fig_settings.legend_fontsize = 8;
fig_settings.left_pos = 5;               % cms
fig_settings.bottom_pos = 5;             % cms
fig_settings.font_type = 'Arial';
fig_settings.dirname = 'Results';              % default directory for figure files
fig_settings.scale =0.15;
fig_dirandname = [fig_settings.dirname fig_settings.name];

fig_width = 7;     %Plos full page figure with two columns           % cms
fig_height = 4;    %Plos full page figure with two rows             % cms
% fig_dirandname = [fig_settings.dirname name];
legLoc= 'best';
legOri = 'vertical';
