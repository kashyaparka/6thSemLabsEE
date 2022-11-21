clc
close all
clear all
kp = 4;
kd = [1 2 3 4 18];
ki = 5;
for k = 1:length(kd)
    D = pid(kp,ki,kd(k));
    G = tf(1,[1 2 5]);
    H(k) = feedback(D*G,1);
    
    
end

step(H(1),H(2),H(3),H(4),H(5))
legend('kd=1','kd=2','kd=3','kd=4','kd=5')
%stepinfo(H)
grid on