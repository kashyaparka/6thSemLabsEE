%exp 3
%1. Find the circular convolution of the two sequences by using DFT (or fft function)
%x1=[1 2 2 0] x2=[1 2 3 4];
%verify the result using circular convolution function.
%(i) Circular convolution using fft function of the two given sequences:

clc;
close all;
% input('Enter x(n):\n');
x=[1 2 2 0]
% input('Enter h(n):\n');
h=[1 2 3 4]
m=length(x);%length of sequence x(n)
n=length(h);%length of sequence h(n)
N=max(m,n);%length of output sequence y(n)
%For equating both sequence length
x=[x,zeros(1,N-m)];
h=[h,zeros(1,N-n)];
n=0:N-1
X=fft(x);%DFT of sequence x(n)
H=fft(h);%DFT of sequence h(n)
%performing element-wise multiplication
Y=X.*H;%DFT of output sequence y(n)
y=ifft(Y);%IDFT of Y(k)
subplot(311)
disp('First Sequence x(n) is:')
disp(x)
stem(n,x)
xlabel('n')
ylabel('x(n)')
title('First Sequence')
grid on;
subplot(312)
disp('Second Sequence h(n) is:')
disp(h)
stem(n,h)

xlabel('n')
ylabel('h(n)')
title('Second Sequence')
grid on;
subplot(313)
disp('Convoluted Sequence Y(n) is:')
disp(y)
stem(n,y)
xlabel('n')
ylabel('Y(n)')
title('Circular Convoluted Sequence')
grid on;

%(ii) Verification of result using two different methods:
%Method 1: Circular convolution using cconv function:
clc
clear all
close all
x=[1 2 2 0];
y=[1 2 3 4];
c=cconv(x,y,4);


%Method 2: Circular convolution using DFT and IDFT:
clc
close all;
clear all;
% x=input('enter the value of first input sequence');
x=[1 2 2 0];
disp('1st i/p sequence is');
disp(x);
% h=input('enter the values of 2nd dft sequence');
h=[1 2 3 4];
disp('2nd i/p sequence is');
disp(h);
lx=length(x);
lh=length(h);
N=max(lx,lh);
xx=[x zeros(N-lx)];
HH=[h zeros(N-lh)];
W=zeros(N,N);
for n=0:N-1
for k=0:N-1
W(n+1,k+1)=exp(-i*2*pi*n*k/N);
end;
end;
X=W*xx.';
H=W*HH.';
disp('DFT of 1st sequence is');
disp(X.');
disp('DFT of 2nd sequence is');
disp(H.');
figure
subplot(2,1,1);
stem(x);
title('1st i/p sequence');

subplot(2,1,2);
compass(X);
title('dft of 1st sequence');
figure
subplot(2,1,1);
stem(h);
title('2nd i/p sequence');
subplot(2,1,2);
compass(H);
title('dft of 2nd sequence');
YY=X.*H;
w=zeros(N,N);
for n=0:N-1
for k=0:N-1
w(n+1,k+1)=exp(i*2*pi*n*k/N);
end;
end;
B=w*YY;
Y=B/N;
disp('Dft of o/p sequence is');
disp(YY.');
disp('IDFT of o/p sequence is');
disp(Y.');
figure
subplot(2,1,1)
compass(YY);
title('o/p DFT sequence of result');
subplot(2,1,2);
compass(Y);
title('circular convoluted o/p');