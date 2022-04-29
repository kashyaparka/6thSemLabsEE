clc
 clear all
 l= loadcase('case14');
 %% Load the data
 e= runpf(l);
 y= l;
  y. branch(:,3)= 1.1.* y. branch(:,3); % TRANSMISSION LINE PARAMETER
  y. branch(:,4)= 1.1* y. branch(:,4);
% y.bus(:,3)=1.1.*y.bus(:,3); %%% POWER DEMAND in case of unity pf.
% y.bus(:,4)=1.2.*y.bus(:,4);
  x= runpf(y);
 
  % Sending end Voltage
 Vs= l.bus(:,8);
 
 k=e.bus(:,8);% After load flow Voltage.
 h=x.bus(:,8);
 r=((k-h)./k).*100;
 t=[ Vs k h r]