%nyquist daigram
clc
clear all
close all

s=tf('s');

figure
G=(1/s);
bode(G);
grid on
figure
nyquist(G);
allmargin(G)
grid on;

% figure
% G=(1/(s+2));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% figure
% G=(1/((s+1)*(s+2)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% figure
% G=(100/(s*s+2*s+10));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% figure
% G=(1/(s*(s+1)*(s+2)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% figure
% G=((s+3)/(s*(s+1)*(s+2)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% figure
% G=(100/(s*(s+2)*(s*s+4)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% 
% figure
% G=(10/(s*s*(s+2)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% 
% figure
% G=(10*(s-1)/(s*(s+2)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;
% 
% 
% figure
% G=(68/(s*(s+2)*(s*s+2*s+17)));
% bode(G);
% figure
% nyquist(G);
% allmargin(G)
% grid on;