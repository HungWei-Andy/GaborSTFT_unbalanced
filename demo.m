clear all;
close all;
clc;

% load music
[music, fs] = audioread('Chord.wav');
x=music(:,1);% only extract the first channel

% parameters
dt = 0.01;
df = 1;
tau = (0 : length(x)-1) / fs;
t = 0:dt:max(tau);
f = 20:df:500;

for sgm_log = 1: 0.5: 3
  sgm = 10 ^ sgm_log;

  % tf transform
  tic();
  tf = Gabor (x, tau, t, f, sgm);
  elapsedTime = toc();

  % show the result
  show_tf(tf, t, f, elapsedTime, ['Gabor, sigma=' num2str(round(sgm))]);
end