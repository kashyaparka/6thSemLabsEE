%EXP6
%IIR FILTER DESIGN

clc
clear all
close all
T=1;
wp=0.2*pi;
ws=0.6*pi;
e=sqrt(1/0.8^2-1);
A=1/0.2;
Wp=(2/T)*tan(wp/2);
Ws=(2/T)*tan(ws/2);
N=ceil((1/2)*(log10(e^2/(A^2-1)))/(log10(wp/ws)));
Wc=Wp/((e^2)^(1/(2*N)));
[b,a]=butter(N,Wc,'low','s');
Hs=tf(b,a);

% bilinear transformation
[numd,dend]=bilinear(b,a,1/T);
Hz=tf(numd,dend,T);
w=0:0.01:pi;
Hw=freqz(numd,dend,w);
subplot(2,1,1);
plot(w/pi,abs(Hw));
xlabel('frequency in pi units');
ylabel('Magnitude');

% impulse invarient
[numd,dend]=impinvar(b,a,1/T);
Hz=tf(numd,dend,T);
w=0:0.01:pi;
Hw=freqz(numd,dend,w);
subplot(2,1,2);
plot(w/pi,abs(Hw));
xlabel('frequency in pi units');
ylabel('Magnitude');