%%
cd 'C:\Users\chadw\OneDrive\Desktop\DSP\Project\DSP_Project\Models'

%% Run Simulation
%% HPF

% Variable Defintions Sine Wave
HPF_Sine_Amplitude = 1; %Sine wave amp
HPF_Sine_Freq = 100; %Hz

% Variable Defintions - High Pass Filter
HPF_StopBand_Freq = .2; %8e3; %Hz
HPF_PassBand_Freq = 20; %12e3; %Hz

HPF_StopBand_Amp = 80; %Db
HPF_PassBand_Amp = .5; %.1; %Db

% Run Sim
sim('HPF.slx')
open('HPF.slx')
%% BPF
% Variable Defintions Sine Wave
BPF_Sine_Amplitude = 1; %Sine wave amp
BPF_Sine_Freq = 100; %Hz

% Variable Defintions - High Pass Filter
MHz_Conv = 1e-6;

BPF_StopBand_Freq1 = .1*MHz_Conv;%.1; %8e3; %Hz
BPF_StopBand_Freq2 = 10000*MHz_Conv; %8e3; %Hz

BPF_PassBand_Freq1 = 10*MHz_Conv; %12e3; %Hz
BPF_PassBand_Freq2 = 100*MHz_Conv; %12e3; %Hz

BPF_StopBand_Amp1 = 80; %Db
BPF_StopBand_Amp2 = 80; %.1; %Db

% Run Sim
%sim('BPF.slx')

%% Log Results

%% Display Results