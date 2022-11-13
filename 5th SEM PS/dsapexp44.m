%3. Generate a signal x  5sin(2* pi *t)  6sin(6* pi *t)

%Generate sample with proper sampling frequency and findout the DFT of the sequence. Plot the magnitude and phase
%against the discrete frequency.
%(i) Generating signal with proper sampling frequency:
clc
clear all;
close all;
t = 0:1e-3:1000e-3;
y0 = 5*sin(2*pi*t)+5*sin(6*pi*t);
figure(1),
subplot(2,1,1),plot(t,y0,'--');
xlabel('t');ylabel('x(t)'),hold on
subplot(2,1,2),plot(t,y0,'--');
xlabel('t');ylabel('x(t)'),hold on
figure(2),
subplot(2,1,1),plot(t,y0,'--');
xlabel('t');ylabel('x(t)'),hold on
subplot(2,1,2),plot(t,y0,'--');
xlabel('t');ylabel('x(t)'),hold on
t1 = 0:1/120:1000e-3; % (a) Ts = 1/18s;
y1 = 5*sin(2*pi*t1)+5*sin(6*pi*t1);
figure(1)
subplot(2,1,1),stem(t1,y1,'fill');
title('T_s=1/18s'),hold off
t2 = 0:1/60:1000e-3; % (b) Ts = 1/12s;
y2 = 5*sin(2*pi*t2)+5*sin(6*pi*t2);
figure(1)
subplot(2,1,2),stem(t2,y2,'fill');
title('T_s=1/12s'),hold off
t3 = 0:1/30:1000e-3; % (c) Ts = 1/6s;
y3 = 5*sin(2*pi*t3)+5*sin(6*pi*t3);
figure(2)
subplot(2,1,1),stem(t3,y3,'fill');
title('T_s=1/6s'),hold off
t4 = 0:1/15:1000e-3; % (d) Ts = 1/3s;
y4 = 5*sin(2*pi*t4)+5*sin(6*pi*t4);
figure(2)
subplot(2,1,2),stem(t4,y4,'fill');
title('T_s=1/3s'),hold off


%(ii) To find out DFT of signal and plotting magnitude and phase plots
clc
clear all;
close all;
t = 0:1/10:10-1/100;
x = 5*sin(2*pi*t)+5*sin(6*pi*t);
y = fft(x); % Compute DFT of x
m = abs(y); % Magnitude
y(m<1e-6) = 0;
p = unwrap(angle(y)); % Phase
f = (0:length(y)-1)*100/length(y); % Frequency vector
figure(3)
subplot(2,1,1)
plot(f,m)
title('Magnitude')
ax = gca;
ax.XTick = [25 50 75 100];
subplot(2,1,2)
plot(f,p*180/pi)
title('Phase')
ax = gca;
ax.XTick = [25 50 75 100];