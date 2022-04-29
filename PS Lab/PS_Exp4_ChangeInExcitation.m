clc
clear all
%% loading of the case data
k=loadcase('case30');
%% run power flow
y=runpf(k);
%% CHANGE IN EXICITATION
e=k;
e.gen(:,6)=1.01*e.gen(:,6);
l=runpf(e);
%%
 m=y.bus(:,8);% After load flow Voltage.
 h=l.bus(:,8);
 r=((h-m)./h).*100;
 t=[ m h r]