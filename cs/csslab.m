close all
clear all
clc
y0=[0 2]; %initial condition
tspan=[0 20]; %time in seconds
%The given constants are:
omega=10/11;%in rad/s
sigma=0.5;
A=10/11;
%assume y=y(1)
% equation 1: dy(1)=y(2)
%equation 2: dy(2) = -2*sigma*omega*y(2)-omega*omega*y(1)+omega*omega*u;
odefun=@(t,y) [y(2) %1st ode
-2*sigma*omega*y(2)-omega*omega*y(1)+omega*omega*A*sin(2*t)]; %2nd ode
%solving the differential equation using ode45 subroutine
[t,y]=ode45(odefun,tspan,y0);
u=A*sin(2*t);
plot(t,y(:,1),t,u);
title('y(t),u(t) vs t');
xlabel('time (s)','FontSize', 10,'FontName','Arial','FontWeight','bold');
ylabel('y(t)','FontSize', 10,'FontName','Arial','FontWeight','bold');
legend('y(t)','u(t)')
grid on