%6Root locus
clc 
clear all;
close all;
% 
% G = tf([1],[1 1]);
% rlocus(G);
zeta = 0.45;
th = acos(zeta);
m = tan(th);
x = -5:0.01:5;
y = m*x;

sys1 = zpk([],-1,1);
subplot(2,3,1)
plot(x,y)
hold on
rlocus(sys1)


sys2 = zpk([-1],[0 2],1);
subplot(2,3,2)
rlocus(sys2)
hold on
plot(x,y)

sys3 = zpk([],[-1 -2 -3],1);
subplot(2,3,3)
rlocus(sys3)
hold on
plot(x,y)


sys4 = zpk([],[0 -1 -2],1);
subplot(2,3,4)
plot(x,y)
hold on
rlocus(sys4)

sys5 = zpk([],[0 -2 -1+2*1i -1-2*1i],1);
subplot(2,3,5)
plot(x,y)
hold on
rlocus(sys5)

sys6 = zpk([-1+2*1i -1-2*1i],[0 0 -2 -4],1);
subplot(2,3,6)
plot(x,y)
hold on
rlocus(sys6)
