num = [1 3 5];
den = [1 9 11 12];
poles = roots(den);
zeros = roots(num);
tf(num,den);
plot(step(tf(num,den)));
grid on