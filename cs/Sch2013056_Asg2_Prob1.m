%exp1 differential equation
clc
close all
clear all
w = 2;
K = 1;
z = [0 0.2 0.5 0.7 0.9 1];
for k = 1:length(z)
    sys(k) = tf(K*w^2,[1 2*z(k)*w w^2]);
    
end

figure(1)
step(sys(1),sys(2),sys(3),sys(4),sys(5),sys(6));
legend('\zeta=0','\zeta=0.2','\zeta=0.5','\zeta=0.7','\zeta=0.9','\zeta=1')
axis([0 10 -0.2 2.2])
title('Step response for different \zeta')
grid on


w = [2 4 6 8];
z = 0.5;
for k = 1:length(w)
    sys(k) = tf(K*w(k)^2,[1 2*z*w(k) w(k)^2]);
end

figure(2)
step(sys(1),sys(2),sys(3),sys(4));
legend('{\omega} n=2','{\omega} n=4','{\omega} n=6','{\omega} n=8')
axis([0 6 0 1.3])
title('Step response for different \omega_n')
grid on


w = 2;
zeta = linspace(0,1,100);
for k = 1:length(zeta)
    sys(k) = tf(K*w^2,[1 2*zeta(k)*w w^2]);
    responseData = stepinfo(sys(k));
    tr(k) = responseData.RiseTime;
    tp(k) = responseData.PeakTime;
    mp(k) = responseData.Overshoot;
    ts(k) = responseData.SettlingTime;
end

figure(3)
subplot(2,2,1)
plot(zeta,tr)
xlabel('Ramping ratio (\zeta)')
ylabel('Rise time (t_r)')
grid on


subplot(2,2,2)
plot(zeta,tp)
xlabel('Ramping ratio (\zeta)')
ylabel('Peak time (t_p)')
grid on


subplot(2,2,3)
plot(zeta,mp)
xlabel('Ramping ratio (\zeta)')
ylabel('Peak overshoot (M_p)')
grid on


subplot(2,2,4)
plot(zeta,ts)
xlabel('Ramping ratio (\zeta)')
ylabel('Settling time (t_s)')
grid on
axis([0.2 1 0 10])

wn = linspace(2,8,100);
zeta = 0.5;
for k = 1:length(wn)
    sys(k) = tf(K*wn(k)^2,[1 2*zeta*wn(k) wn(k)^2]);
    responseData = stepinfo(sys(k));
    tr(k) = responseData.RiseTime;
    tp(k) = responseData.PeakTime;
    mp(k) = round(responseData.Overshoot,1);
    ts(k) = responseData.SettlingTime;
end

figure(4)
subplot(2,2,1)
plot(wn,tr)
xlabel('Natural frequency {\omega_n}')
ylabel('Rise time (t_r)')
grid on


subplot(2,2,2)
plot(wn,tp)
xlabel('Natural frequency {\omega_n}')
ylabel('Peak time (t_p)')
grid on


subplot(2,2,3)
plot(wn,mp)
xlabel('Natural frequency {\omega_n}')
ylabel('Peak overshoot (M_p)')
grid on


subplot(2,2,4)
plot(wn,ts)
xlabel('Natural frequency {\omega_n}')
ylabel('Settling time (t_s)')
grid on
