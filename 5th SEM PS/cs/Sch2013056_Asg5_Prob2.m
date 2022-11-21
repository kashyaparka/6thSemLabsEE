%exp5 PID controller by x-N O/L method
clc
close all
clear all

G=zpk([],[-1 -2 -3],5);
H=feedback(G,1);
%step response for original transfer function
%subplot(2,2,1)
step(H)
grid on


%defining values of Kp
%Kp=2:15;
%for loop for various values of Kp
%for td=1:14
    %defining D(s)
    %D=Kp(td);
    %figure(td+1)
    %defining the unity feedback loop
    %H1(td)=feedback(G*D,1);
    %step(H1(td));
    %grid on
    %title(['Step response for Kp=',sprintf('%d',td+1)]);
%end

Kc=12;
Tc=1.9;
D=Kc;
H2=feedback(G*D,1);
subplot(2,2,1)
%step response for transfer function when Kp=12
step(H2)
stepinfo(H2)
title('Step response for Kp=12')

% For P controller
Kp=0.5*Kc;
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
Kp=0.45*Kc;
Ti=1*Tc/1.2 ;
Td=0;
D=pid(Kp,Kp/Ti,Kp*Td);
H=feedback(G*D,1);
subplot(2,2,3)
step(H);
grid on
title('Response for PI control')
fprintf('Kp=%f Ti=%f Td=%d\n\n',Kp,Ti,Td);

% For PID controller
Kp=0.6*Kc;
Ti=0.5*Tc;
Td=0.125*Tc;
D=pid(Kp,Kp/Ti,Kp*Td);
H=feedback(G*D,1);
subplot(2,2,4)
step(H);
grid on
title('Response for PID control')
fprintf('Kp=%f Ti=%f Td=%d\n\n',Kp,Ti,Td);



