%{
* FILE DESCRIPTION
* File: Execution_time_of_DFT_and_FFT.m
* Description of the porject:
    Part 1:
            It is required to compare between the execution time of Discrete Fourier
            Transform (DFT) and Fast Fourier Transform (FFT).
* Author: Omar Muhammad Mustafa, Omar Amr Mahmoud Hafez, Reem Muhammad, Sahar Adel
* Date: 27th December 2023
%}
%% clear all WorkSpace Variables and Command Window
clc;
clear ;
close all;

%% Parameters
% Decide whether user interafce to be used or generation of random data
% 1 : User Interface is on
% 0 : Random generation of data to be used
userInterface = 0;
% Number of samples to be generated, i.e. length of X[n]
L_Xin = 4096;

%% Read the sequence from the user that it to be processed using DFT
fprintf('----------  Execution time comparison between DFT and FFT  ----------\n')

if (userInterface == 1)
    x_n = input(" Enter the sequence in this form [x(n1),x(n2),x(n3),...]\n");
    N = input(" Enter the vale of N, where N is Number of samples in frequency domain\n");
else
    x_n = randi([0 20],1,L_Xin);
    N = L_Xin;
end
%% Compute the DFT of the entered time sampled signal
fprintf('Execution time using the implemented function\n')
tic
X_k = dftFuntion(x_n,N);
toc

fprintf('--------------------\n')

fprintf('Execution time using the built-in fft() function\n')
tic
X_k_FFT = fft(x_n);
toc
%End of the code