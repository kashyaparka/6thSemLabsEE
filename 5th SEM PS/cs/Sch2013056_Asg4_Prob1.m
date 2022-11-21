clc
close all
clear all
kp = [1 2 3 4 18];
kd = 0;
ki = 0;
for k = 1:length(kp)    
    D = pid(kp(k),ki,kd);
    G = tf(1,[1 2 5]);
    H(k) = feedback(D*G,1);
    
    
end

step(H(1),H(2),H(3),H(4),H(5))
legend('kp=1','kp=2','kp=3','kp=4','kp=5')
%stepinfo(H)
grid on