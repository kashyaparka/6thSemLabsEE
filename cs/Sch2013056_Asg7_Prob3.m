%bode daigarm
clc;
clear all;
close all;

s = tf('s');
t = [0 0.5 1.5 2];

for i=1:length(t)
    OLTF(i) = tf(exp(-t(i)*s))*zpk([],[0 -1 2],1);
end
figure
for i=1:length(OLTF)
    bode(OLTF(i))
    hold on;
end
legend('td=0.5','td=0.5','td=1.5','td=2')
