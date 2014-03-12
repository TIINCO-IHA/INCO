% main-funktion til encoding af cyclic codes og meggitt decoding
clear all, close all, clc;
addpath('../Encoder');
% addpath('../Meggitt');

% Generate message vector
n = 15;
k = 7;
g = [1 0 0 0 1 0 1 1 1];
% m = zeros(1,k);

% generate random numbers in GF(2)
m = mod(randi(2,1,k),2);

% Encode message vector by the ciclic code encoder
c = cyclicEncoding(g,m,n,k);

% Transmit code vector through an artificial communication channel, i.e.,
% introduce errors to the code vector
t = 1; % or t = 2
% t = 2;
errorlocation = sort(randi(n,1,t));   % randi could generate the same two numbers, if t = 2. This must be avoided with some check
r = c;
% Flip bit at generated error location i the received vector.
% Add 1 and modulo 2 for binary addition
r(errorlocation) = mod(c(errorlocation)+1,2);

% Decode the received vector by the meggitt decoder

