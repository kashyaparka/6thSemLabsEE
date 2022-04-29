clc;
clear all;
r=loadcase('case30')
mpopt=mpoption('pf.alg','GS');
d=runpf(r,mpopt);