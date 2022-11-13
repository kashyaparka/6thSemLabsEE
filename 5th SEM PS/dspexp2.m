%EXP NO: 02

% Illustration of Up-Sampling by an Integer Factor
n = 0:50;
x= sin(2*pi*0.12*n);
y = zeros(1, 3*length(x));
y([1: 3: length(y)]) = x;
subplot(2,1,1)
stem(n,x);
title('Input Sequence');
xlabel('Time index n');ylabel('Amplitude');
subplot(2,1,2)
stem(n,y(1:length(x)));
title('Output Sequence');
xlabel('Time index n');ylabel('Amplitude'); 

%Illustration of Down-Sampling by an Integer Factor
n = 0: 49;
m = 0: 50*3 - 1;
x = sin(2*pi*0.042*m);
y = x([1: 3: length(x)]);
subplot(2,1,1)
stem(n, x(1:50)); axis([0 50 -1.2 1.2]);
title('Input Sequence');
xlabel('Time index n');
ylabel('Amplitude');
subplot(2,1,2)
stem(n, y); axis([0 50 -1.2 1.2]); 


%Program 3 can be employed to study the frequency-domain properties of the
downsampler.
% Program 3
% Effect of Down-sampling in the Frequency Domain
% Use fir2 to create a bandlimited input sequence
freq = [0 0.42 0.48 1]; mag = [0 1 0 0];
x = fir2(101, freq, mag);
% Evaluate and plot the input spectrum
[Xz, w] = freqz(x, 1, 512);
subplot(2,1,1);
plot(w/pi, abs(Xz)); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Input Spectrum');
% Generate the down-sampled sequence 
M = input('Type in the down-sampling factor = '); % Input down-sampling factor an
integer, vary and observe (say 5)
y = x([1: M: length(x)]);
% Evaluate and plot the output spectrum
[Yz, w] = freqz(y, 1, 512);
subplot(2,1,2);
plot(w/pi, abs(Yz)); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Output Spectrum'); 

% 4. (a) Consider an analog signal x(t) consisting of three sinusoids of frequencies of 1
% kHz, 4 kHz, and 6 kHz:
% x(t)= cos(2πt)+ cos(8πt)+ cos(12πt)
% where t is in milliseconds. Show that if this signal is sampled at a rate of fs = 5 kHz,
% it will be aliased with the following signal, in the sense that their sample values will
% be the same:
% xa(t)= 3 cos(2πt)
% On the same graph, plot the two signals x(t) and xa(t) versus t in the range 0 ≤ t ≤ 2
% msec. To this plot, add the time samples x(tn) and verify that x(t) and xa(t) intersect
% precisely at these samples. These samples can be evaluated and plotted as follows:
% fs = 5; T = 1/fs;
% tn = 0:T:2; xn = x(tn);
% plot(tn, xn, ‘.’); 
% 
clc;
clear all;
close all;
t=0:0.01:2
x = cos(2*pi*t)+ cos(8*pi*t)+ cos(12*pi*t);
plot(t,x);
hold on
plot(t,3*cos(2*pi*t),'_','color','black');
hold on
fs = 5; 
T = 1/fs;
tn = 0:T:2;
xn = cos(2*pi*tn)+ cos(8*pi*tn)+ cos(12*pi*tn);
plot(tn, xn,'_','color','red');
grid on
axis([0 2 -4 4]);
ylabel('X(t),Xa(t)');
xlabel('t(in nsec)');
tittle('fs =5 KHz')




