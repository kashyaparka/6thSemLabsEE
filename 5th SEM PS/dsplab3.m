%EXP NO: 03

%LINEAR CONVOLUTION
x=[1 1 1 1];
h=[1 1 1 1];
y=conv(x,h);
subplot(3,1,1);
stem(x);
xlabel('sequence');
ylabel('amplitude x(n)');
title('linear convolution');
subplot(3,1,2);
stem(h);
xlabel('sequence');
ylabel('amplitude h(n)');
subplot(3,1,3);
stem(y);
xlabel('sequence');
ylabel('amplitude y(n)');

%CIRCULAR CONVOLUTION
clc;
clear all;
N=input('N=');
x=input('Enter x=');
h=input('Enter y=');
n=0;
disp('The result of circular convolution is');
for m=1:N;
sum=0;
for k=1:N;
if((m-k)>=0)
n=m-k+1;
else
n=m-k+N+1;
end
sum=sum+x(k)*h(n);
end
disp(sum);
end


% Assignment 1: use cconv(x,y,Length) to perform circular convolution.
% Assignment 2: Write down the code for linear convolution function in MATLAB.
% Assignment 3: Perform linear convolution in MATLAB Simulink.
%ANS1:
clc;
close all;
clear all;
N=4;
X=[1, 2, 3, 4]
Y=[ 1, 2,3, 4]
disp('The result of circular convolution');
Circ=cconv(X,Y,N); %cconv circularly convlues vector x and y and N is the length of vector X ,Y
subplot(1,1,1)    %Circ matlab function to return a generalized circular/elliptical mask
stem(Circ,'field')
ylim([0 22])
grid on
title('circular convolution of x and y')


%ANS2

% n=-20:20;
% x=[ 2 1 2 3];
% h=[1 2 3 4];
% N=length(x);
% M=length(h);
% Ny=N+M-1;
% y=zeros(1,Ny);
% for i=1:N
%     for k=  1:M
%         y(i+k-1)=y(i+k-1)+h(k)*x(i);
%     end 
% end       
% disp('The result of linear convolution is');
% subplot(1,1,1);
% stem(y,'filled','color','blue');
% ylim([0 22]);
% title('linear convolution of x and h');
% grid on



%ANS3
simulink



