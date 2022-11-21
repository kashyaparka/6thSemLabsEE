%exp5 prob1 PID controller by Z-N O/L method
clc
clear all
close all

G=zpk([],[-1 -2 -3],5);
subplot(2,2,1)
step(G)
hold on
title('Step Response for G(s)')

[y,t] = step(G);
h = mean(diff(t));

% Numerical Derivative
dy = gradient(y, h);

% Index Of Maximum
[~,idx] = max(dy);

% Regression Line Around Maximum Derivative
b = [t([idx-1,idx+1]) ones(2,1)] \ y([idx-1,idx+1]);

% Independent Variable Range For Tangent Line Plot
tv = [-b(2)/b(1); (1-b(2))/b(1)];

% Calculate Tangent Line
f = [tv ones(2,1)] * b;                            
hold on

% Tangent Line
plot(tv, f, '-r')

% Maximum Vertical
plot(t(idx), y(idx), '.r')                                     
hold off
grid on

% value of L
L=tv(1);

% value of T
T=tv(2)-tv(1);

% For P controller
Kp=T/L;
Ti=inf;
Td=0;

D=pid(Kp,Kp/Ti,Kp*Td);
H=feedback(G*D,1);
subplot(2,2,2)
step(H);
grid on
title('Response for P control')
fprintf('Kp=%f Ti=%f Td=%d\n\n',Kp,Ti,Td);


% For PI controller
kp=0.9*T/L;
Ti=L/0.3;
Td=0;

D=pid(kp,kp/Ti,kp*Td);
H=feedback(G*D,1);
subplot(2,2,3)
step(H)
grid on
title('Response for PI controller')
fprintf('Kp=%f Ti=%f Td=%d\n\n',kp,Ti,Td);

% For PID controller
kp=1.2*T/L;
Ti=2*L;
Td=0.5*L;

D=pid(kp,kp/Ti,kp*Td);
H=feedback(G*D,1);
subplot(2,2,4)
step(H)
grid on
title('Response for PID controller')
fprintf('Kp=%f Ti=%f Td=%d\n\n',kp,Ti,Td);