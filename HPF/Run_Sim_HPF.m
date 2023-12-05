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
%open('HPF.slx')

%% Filtered Violin Graph
Filtered_violin = ans.Violin_Filtered;
Filtered_violini = Filtered_violin.Data;
Filtered_violini(:,1) = [];
Filtered_violini = Filtered_violini';