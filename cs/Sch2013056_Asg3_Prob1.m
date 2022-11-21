%exp 3 :transientperformance adding poles and zeros
clc 
clear all
close all

oltf = zpk([],[0 -1 -8],1);
clorg = feedback(oltf,1);

zs = [0.5 1 2 5 10 20];
for k = 1:length(zs)
    clsys(k) = feedback(oltf *tf([1 zs(k)],[zs(k)]),1);
end

figure(1)
step(clorg, 'k--',clsys(1),clsys(2),clsys(3),clsys(4),clsys(5),clsys(6));
grid on
legend('Original system','z=-0.5','z=-1','z=-2','z=-5','z=-10','z=-20');

ps = [0.5 1 2 5 10 20];
for k=1:length(ps)
    clsyspp(k) = feedback(oltf *tf([ps(k)],[1 ps(k)]),1);
end

figure(3)
step(clorg,'k--',clsyspp(1),clsyspp(2),clsyspp(3),clsyspp(4),clsyspp(5),clsyspp(6));
legend('Original system','p=-0.5','p=-1','p=-2','p=-5','p=-10','p=-20');
grid on

tds = [0.1 1 2 3];
for k=1:length(tds)
    clsystds(k) = feedback(oltf *tf(1,1,'InputDelay',tds(k)),1);
end

figure(5)
step(clorg,clsystds(1),clsystds(2),clsystds(3),clsystds(4));
grid on
legend('Original system','t_d=0.1','t_d=0.5','t_d=1','t_d=1.5');
