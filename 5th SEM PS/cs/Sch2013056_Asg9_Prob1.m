%exp9 lag lead compenstaor
clc
clear all
close all

g = zpk([],[0 -1], [1]);
zeta = 0.456;
wn = 2.19;
pd = (-zeta*wn)+(j*wn*sqrt(1-zeta^2))
p = [0 1];
phi = -180 + sum(angle(p+pd)*(180/pi))
pole_angle = angle(p(1)+pd)*180/(2*pi)-phi/2;
zero_angle = angle(p(1)+pd)*180/(2*pi)+phi/2;
Pc = wn*sqrt(1-zeta^2)/tand(pole_angle) + zeta*wn;
Zc = wn*sqrt(1-zeta^2)/tand(zero_angle) + zeta*wn; 
Kc = abs((pd+Pc)* pd*(pd+1)/(1*(pd+Zc)));

gcs = zpk(-Zc,-Pc,Kc)
new_gs = gcs*g
rlocus(new_gs);