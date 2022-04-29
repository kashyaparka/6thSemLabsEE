

clc;
clear all;
r=loadcase('case30');
t=runpf(r)
v=t.bus(:,8)
plot(v)