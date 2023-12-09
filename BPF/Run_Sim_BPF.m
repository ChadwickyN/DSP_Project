%% BPF
% Variable Defintions Sine Wave
BPF_Sine_Amplitude = 1; %Sine wave amp
BPF_Sine_Freq = 100; %Hz

% Variable Defintions - Band Pass Filter
MHz_Conv = 1e-6;

BPF_StopBand_Freq1 = .1%.1; %8e3; %Hz
BPF_StopBand_Freq2 = 10000 %8e3; %Hz

BPF_StopBand_Norm_Freq1 = .1/pi;%.1; %8e3; %Hz
BPF_StopBand_Norm_Freq2 = 10000/pi %8e3; %Hz

BPF_PassBand_Freq1 = 10 %12e3; %Hz
BPF_PassBand_Freq2 = 100 %12e3; %Hz

BPF_PassBand_Norm_Freq1 = 10/pi; %12e3; %Hz
BPF_PassBand_Norm_Freq2 = 10/pi; %12e3; %Hz

BPF_StopBand_Amp1 = 80; %Db
BPF_StopBand_Amp2 = 80; %.1; %Db

% Run Sim

%% Activity 3 - Varying Sine wave and Dirac function
% Simulink has a max of 100 frequencies for sine wave
step = 10000;
Start_Freq = 1; %Hz
End_Freq = 100000; %Hz

%%% SINE WAVE FREQ ARBITRATION WITH COMMENT
%Vary_Sine_Var = Start_Freq:step:End_Freq; 
Vary_Sine_Var = [100, 1000, 100000, 200000];

Vary_Sine_Feq = Vary_Sine_Var

% Activity 3 - Varying Diraq wave

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

%% Filtered Violin Graph
Filtered_violin = ans.Violin_Filtered;
Filtered_violini = Filtered_violin.Data;
Filtered_violini(:,1) = [];
Filtered_violini = Filtered_violini';



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