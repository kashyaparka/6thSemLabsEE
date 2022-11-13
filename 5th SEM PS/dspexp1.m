%EXP1
%Generation of basic signals


%unit step
n=input('enter the N value ');
t=0:1:n-1;
y1=ones(1,n);
subplot(3,2,2);
stem(t,y1);
ylabel('amplitude');
xlabel('n');
title('unit step');
%unit ramp
n1=input('enter the length of the ramp sequence');
t=0:n1;
subplot(3,2,3);
stem(t,t);
ylabel('amplitude');
xlabel('n');
title('unit ramp');
%unit impulse
clc;clear all;
t=-2:1:2;
y=[zeros(1,2),ones(1,1),zeros(1,2)];
subplot(3,2,1);
stem(t,y);
ylabel('amplitude');
xlabel('n');
title('unit impulse');
%exponential wave
n2=input('enter the length of exponential sequence');
t=0:n2;
a=input('enter the a value');
y2=exp(a*t);
subplot(3,2,4);
stem(t,y2);
ylabel('amplitude');
xlabel('n');
title('exponential sequence');
%sine wave
t=0:0.01:pi;
y3=sin(2*pi*t);
subplot(3,2,5);
plot(t,y3);
ylabel('amplitude');
xlabel('t');
title('sine wave');
%cosine wave
t=0:0.01:pi;
y4=cos(2*pi*t);
subplot(3,2,6);
plot(t,y4);
ylabel('amplitude');
xlabel('t');
title('cosine wave');

%assign1
clc;
 clear all;
 close all;
 subplot(2,1,1)
 t=0:1:10;
 stem(t,t-7);
 hold on;
 s=11:1:22
 stem(s,s-17);
 hold on;
 z=23:1:29;
 stem(z,z-27);
 ylabel('amplitude')
 xlabel('time in units of 0.00015')
 title('assignt of 1')
 t=0:29;
 subplot(2,1,2);
 ylabel('amplitude')
 xlabel('time in unit of 0.0015');
 y=10*[ones(1,5),-ones(1,5),ones(1,5),-ones(1,5),one(1,5),-ones(1,5)];
 stem(t,y);
 
 %assign2
 n=-6:1:-4;
y=zeros(1,3);
y=zeros(1,3);
subplot(3,1,1);
stem(n,y);
hold on;
n=0:1:3;
y1=1-n/3;
stem(n,y1);
hold on;a
n=4:1:7;
y1=zeros(1,4);
stem(n,y1);
xlabel('time in units of 0.0001s')
ylabel('amplitude')

t1=-3:3;
output=[1 1 1 1 0.67 0.33 0];
subplot(3,1,2);
stem(t1,output);
xlabel('time in unit of 0.0001')
ylabel('amplitude')
t=-3:-1;
y1=ones(1,3);
subplot(3,1,3);
stem(t,y1);
hold on;
t=0:3;
y2=1-(1/3)*t;
stem(t,y2);
grid on;
xlabel('time in units of 0.0001s')
ylabel('amplitude')
