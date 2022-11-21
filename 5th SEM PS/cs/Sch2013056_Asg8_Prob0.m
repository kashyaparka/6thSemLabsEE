%exp8

clc
clear all
close all
n = [1  10];
d = [1  101  100];
sys = tf(10)*tf(n,d);         % Define LTI System
t = linspace(0, 100, 1000);   % Time Vector

w = [0.1 0.2 0.5 1 1.2 2];
for i=1:length(w)
    u = 5*sin(w(i)*t);          % Forcing Function
    y = lsim(sys, u, t);      % Calculate System Response
    figure(i)
    plot(t, y)
    hold on
    plot(t,u)
    xlabel('t')
    ylabel('amplitude')
    str = sprintf('w = %f', w(i));
    title(str)
    grid on
end
