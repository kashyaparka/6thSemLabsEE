%exp4 PID controller prob 0
clc
close all
clear all
kp = [1 2 3 4 5];
kd = 0;
ki = 0;
for k = 1:length(kp)
    D = pid(kp(k),ki,kd);
    G = tf(1,[1 2 5]);
    H(k) = feedback(D*G,1);
    
    
end

figure(1)
step(H(1),H(2),H(3),H(4),H(5))
legend('kp=1','kp=2','kp=3','kp=4','kp=5')
%stepinfo(H)
grid on

kp = 2;
kd = 0;
ki = [1 2 3 4 5 6 7 8 9];
for k = 1:length(ki)
    D = pid(kp,ki(k),kd);
    G = tf(1,[1 2 5]);
    H(k) = feedback(D*G,1);
    
    
end
figure(2)
step(H(1),H(2),H(3),H(4),H(5),H(6),H(7),H(8),H(9))
legend('ki=1','ki=2','ki=3','ki=4','ki=5','ki=6','ki=7','ki=8','ki=9')
%stepinfo(H)
grid on

kp = 4;
kd = [1 2 3 4 5];
ki = 5;
for k = 1:length(kd)
    D = pid(kp,ki,kd(k));
    G = tf(1,[1 2 5]);
    H(k) = feedback(D*G,1);
    
    
end
figure(3)
step(H(1),H(2),H(3),H(4),H(5))
legend('kd=1','kd=2','kd=3','kd=4','kd=5')
%stepinfo(H)
grid on