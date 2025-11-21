# filter_design.m
% Example MATLAB script for designing a digital filter
fs = 48000; % Sampling frequency
fcut = 5000; % Cutoff frequency
order = 4;
[b, a] = butter(order, fcut/(fs/2));
% Plot frequency response
fvtool(b, a);
