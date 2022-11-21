clc
close all
clear all
kp = 2;
kd = 0;
ki = [1 2 3];
for k = 1:length(ki)
    D = pid(kp,ki(k),kd);
    G = tf(1,[1 2 0]);
    H(k) = feedback(D*G,1);
    
    
end

step(H(1),H(2),H(3))
legend('ki=1','ki=2','ki=3','ki=4','ki=5')
%stepinfo(H)
grid on