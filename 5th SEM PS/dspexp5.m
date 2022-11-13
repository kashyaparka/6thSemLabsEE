
%EXP5


%1. Computation of FFT of discrete time signals
 %Program for FFT
 clc;
 clear all;
 close all;
 x=input('Enter the seq');
 n=input('Enter the length of the sequence');
 X=fft(x,n);
 stem(X);
 xlabel('real');
 ylabel('img');
 title('FAST FOURIER TRANSFORM');
 display(X);
 
 
%2. Computation of IFFT (or IDFT) of signals
 %Program for IFFT
 X=input('Enter the seq');
 n=input('Enter the length of the sequence');
 x=ifft(X,n);
 stem(x);
 xlabel('real');
 ylabel('img');
 title('INVERSE FAST FOURIER TRANSFORM');
 display(x);
 
 
%3. Plotting Execution time of FFT of random discrete time signals
Nmax = 3000;
fft_time=zeros(1,Nmax);
for n=1:1:Nmax
x=rand(1,n);
t=clock;
fft(x);
fft_time(n)=etime(clock,t);
end
n=[1:1:Nmax];
bar(n,fft_time)
xlabel('N');
ylabel('Time in Sec');
title('FFT execution times') 


% write a progam to compute 4 point DFT using FFT algorithm
clc;
clear all;
close all;
X=input('enter the sequence: ');
n=length(X);
x_odd=X(1:2:n);
x_even=(2:2:n);
X_odd=fft(x_odd);
X_even=fft(x_even);

fori=1:n/2
X(i)=exp(-1j*2*pi*(i-1)/n)*X_even(i)+X_odd(i);
X(i+n/2)=exp(-1j*2*pi*((i+n/2)-1)/n)*X_even(i)+X_odd(i);

disp(X)
disp(fft(x))
