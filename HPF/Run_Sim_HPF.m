%% HPF
% Project Requirements
Ripple = .25; % dB
Roll_Off = 40; % dB/decade
F3 = 20; %Hz

% Variable Defintions Sine Wave
Center_Freq = 4409.5 %Hz

HPF_Sine_Amplitude = -35.055; %Sine wave amp
HPF_Sine_Freq = Center_Freq; %Hz

%%%% HIGHPASS FILTER DESIGN %%%%
% Variable Defintions - High Pass Filter
HPF_StopBand_Freq = F3/100; %8e3; %Hz
HPF_PassBand_Freq = F3; %12e3; %Hz

HPF_StopBand_Amp = 80; %Db
HPF_PassBand_Amp = Ripple*2; %.1; %Db

%% Activity 2 - Varying Sine wave and Dirac function
% Simulink has a max of 100 frequencies for sine wave
step = 10000;
Start_Freq = 1; %Hz
End_Freq = 100000; %Hz

%%% SINE WAVE FREQ ARBITRATION WITH COMMENT
%Vary_Sine_Var = Start_Freq:step:End_Freq; 

Vary_Sine_Var = [100, 1000, 100000, 200000]; %Freq in Hz

Vary_Sine_Feq = Vary_Sine_Var;

% Open Sim
open('HPF_Activity2');
sim('HPF_Activity2.slx')

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
xlabel('t')
ylabel('Data')


open('HPF_Activity3');
%sim('HPF_Activity3')
