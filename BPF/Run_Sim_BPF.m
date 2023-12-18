%% BPF
% Variable Defintions Sine Wave


BPF_Sine_Amplitude = -35.055; %Sine wave amp
BPF_Sine_Freq = 4409.5; %Hz

%%%% BANDPASS FILTER DESIGN %%%%
% Variable Defintions - Band Pass Filter
MHz_Conv = 1e-6;

BPF_StopBand_Freq1 = .1; %.1; %8e3; %Hz
BPF_StopBand_Freq2 = 10000; %8e3; %Hz

BPF_StopBand_Norm_Freq1 = .1/pi;%.1; %8e3; %Hz
BPF_StopBand_Norm_Freq2 = 10000/pi; %8e3; %Hz

BPF_PassBand_Freq1 = 10; %12e3; %Hz
BPF_PassBand_Freq2 = 100; %12e3; %Hz

BPF_PassBand_Norm_Freq1 = 10/pi; %12e3; %Hz
BPF_PassBand_Norm_Freq2 = 10/pi; %12e3; %Hz

BPF_StopBand_Amp1 = 80; %Db
BPF_StopBand_Amp2 = 80; %.1; %Db

%% Activity 2 - Varying Sine wave and Dirac function
% Simulink has a max of 100 frequencies for sine wave
step = 10000;
Start_Freq = 1; %Hz
End_Freq = 100000; %Hz

%%% SINE WAVE FREQ ARBITRATION WITH COMMENT
%Vary_Sine_Var = Start_Freq:step:End_Freq; 
Vary_Sine_Var = [100, 1000, 100000, 200000];

Vary_Sine_Feq = Vary_Sine_Var;

% Activity 3 - Varying Diraq wave

% Open Sim
open('BPF_Activity2.slx');

%% Activity 3 - Read Audio Files
% Ploting this takes a while due to the size of the vectors

[Violin_Sample_Data,Fs] = audioread('Violin_Sample.wav');
T = 1/Fs; % Sampling period
Length_Violin_Sample = length(Violin_Sample_Data); % Length of Signal
t = ((0:Length_Violin_Sample-1)*T)'; % Time vector

Violin_Sample_Data_i = Violin_Sample_Data(:,1);
Violin_Sample_Data_ii = Violin_Sample_Data(:,2);

Unfiltered_Violin = [t,Violin_Sample_Data_i];

%plot(Violin_Sample_Data_i,t,Violin_Sample_Data_ii,t)

open('BPF_Activity3.slx');


%% Display Results