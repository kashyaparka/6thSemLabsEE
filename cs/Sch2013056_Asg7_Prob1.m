%exp7 system analysis by bode plot prob1
clc
clear all
close all

% s=tf('s');
% 
% k = [0.5, 2, 5, 7, 25, 48, 56];
% for i=1:length(k)
%     figure
%     G=(k(i)/(s*(s+1)*(s+2)));
%     bode(G)
% end

t=[ 0.5 1 2 2.5];
s=tf('s');
for i=1:length(t)
    OLTF(i)=tf(exp(-t(i)*s))*zpk([],[0 -1 -2],1);
    subplot(2,2,i)
    bode(OLTF(i));
    allmargin(OLTF(i))
end
