%% Variable Definition

% Frequency Variable for sine wave
freq_sine = 1;

% for the Diraq function we want a pulse of a singal step
step_size = .01;
period = 2;
pulse_width = (step_size/period);


%% Run Simulation
%% HPF
sim('HPF_Root.slx')

% %% BPF
% sim('BPF_Root.slx')
% %% Main
% sim('Main_Root.slx')
%% Log Results

%% Display Results