%%
cd 'C:\Users\chadw\OneDrive\Desktop\DSP\Project\DSP_Project\Models'

%% Read Audio File
% Ploting this takes a while due to the size of the vectors

[Violin_Sample_Data,Fs] = audioread('Violin_Sample.wav');
T = 1/Fs; % Sampling period
Length_Violin_Sample = length(y); % Length of Signal
t = ((0:Length_Violin_Sample-1)*T)'; % Time vector

Violin_Sample_Data_i = Violin_Sample_Data(:,1);
Violin_Sample_Data_ii = Violin_Sample_Data(:,2);

y = [t,Violin_Sample_Data_i];

plot(Violin_Sample_Data_i,t)

%% HPF

% Load Path
cd 'C:\Users\chadw\OneDrive\Desktop\DSP\Project\DSP_Project\Models'



% Project Requirements
Ripple = .25; % dB
Roll_Off = 40; % dB/decade
F3 = 20; %Hz

% Variable Defintions Sine Wave
HPF_Sine_Amplitude = 1; %Sine wave amp
HPF_Sine_Freq = 100; %Hz

% Variable Defintions - High Pass Filter
HPF_StopBand_Freq = F3/100; %8e3; %Hz
HPF_PassBand_Freq = F3; %12e3; %Hz

HPF_StopBand_Amp = 80; %Db
HPF_PassBand_Amp = Ripple*2; %.1; %Db

% Run Sim
sim('HPF.slx')
open('HPF.slx')
%% BPF
% Variable Defintions Sine Wave
BPF_Sine_Amplitude = 1; %Sine wave amp
BPF_Sine_Freq = 100; %Hz

% Variable Defintions - Band Pass Filter
MHz_Conv = 1e-6;


BPF_StopBand_Freq1 = .1;%.1; %8e3; %Hz
BPF_StopBand_Freq2 = 10000; %8e3; %Hz

BPF_StopBand_Norm_Freq1 = .1;%.1; %8e3; %Hz
BPF_StopBand_Norm_Freq2 = 10000; %8e3; %Hz

BPF_PassBand_Freq1 = 10; %12e3; %Hz
BPF_PassBand_Freq2 = 100; %12e3; %Hz

BPF_PassBand_Norm_Freq1 = 10; %12e3; %Hz
BPF_PassBand_Norm_Freq2 = 100; %12e3; %Hz

BPF_StopBand_Amp1 = 80; %Db
BPF_StopBand_Amp2 = 80; %.1; %Db

% Run Sim
%sim('BPF.slx')

%% PassBand Filter - Matlab
% Run Sim
cd 'C:\Users\chadw\OneDrive\Desktop\DSP\Project\DSP_Project\Models'
sim('BPF.slx')
i = 1;
BPF_Sine_Sim = 0;

BPF_PassBand_Freq1 = 10; %12e3; %Hz
BPF_PassBand_Freq2 = 100; %12e3; %Hz

BPF_Sine_Sim_Raw = out.BPF_Sine_Simi;
BPF_Sine_Sim_mat = (BPF_Sine_Sim_Raw.Data);

while (BPF_Sine_Sim < 10000)
BPF_Sine_Sim(end+1) = (BPF_Sine_Sim_mat(:,i));
i = i+1;
end

bandpass(BPF_Sine_Sim,[BPF_PassBand_Freq1,BPF_PassBand_Freq2],1/1000)

%% Display Results