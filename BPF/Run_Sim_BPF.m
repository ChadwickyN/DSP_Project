%% Activity  3 BPF 

BPF_Sine_Amplitude = 1; %Sine wave amp
BPF_Sine_Freq = 100; %Hz

% Variable Defintions - Band Pass Filter
MHz_Conv = 1e-6;

BPF_StopBand_Freq1 = .1*MHz_Conv%.1; %8e3; %Hz
BPF_StopBand_Freq2 = 10000*MHz_Conv %8e3; %Hz

BPF_StopBand_Norm_Freq1 = .1/pi;%.1; %8e3; %Hz
BPF_StopBand_Norm_Freq2 = 10000/pi %8e3; %Hz

BPF_PassBand_Freq1 = 10*MHz_Conv %12e3; %Hz
BPF_PassBand_Freq2 = 100*MHz_Conv %12e3; %Hz

BPF_PassBand_Norm_Freq1 = 10/pi; %12e3; %Hz
BPF_PassBand_Norm_Freq2 = 10/pi; %12e3; %Hz

BPF_StopBand_Amp1 = 80; %Db
BPF_StopBand_Amp2 = 80; %.1; %Db


%% Read Audio Files
% Ploting this takes a while due to the size of the vectors

[Violin_Sample_Data,Fs] = audioread('Violin_Sample.wav');
T = 1/Fs; % Sampling period
Length_Violin_Sample = length(Violin_Sample_Data); % Length of Signal
t = ((0:Length_Violin_Sample-1)*T)'; % Time vector

Violin_Sample_Data_i = Violin_Sample_Data(:,1);
Violin_Sample_Data_ii = Violin_Sample_Data(:,2);

Unfiltered_Violin = [t,Violin_Sample_Data_i];

plot(Violin_Sample_Data_i,t,Violin_Sample_Data_ii,t)

%% Filtered Violin Graph
Filtered_violin = ans.Violin_Filtered;
Filtered_violini = Filtered_violin.Data;
Filtered_violini(:,1) = [];
Filtered_violini = Filtered_violini';

%% BPF
% Variable Defintions Sine Wave
cd 'C:\Users\chadw\OneDrive\Desktop\DSP\Project\DSP_Project\Models'


%% Display Results