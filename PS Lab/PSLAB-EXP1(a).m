clc
clear al
pd=800;
alpha=[510 310 18];
beta=[7.2 7.85 7.97];
gamma=[0.00142 0.00194 0.00482];
lambda=input('Lamda')
delp=1;
dell=1;
iter=0;
while abs(dell)>0.01
    for i=1:3
        P(i)=(lambda-beta(i))/(2*gamma(i));
    end
    delp=P(1)+P(2)+P(3)-pd;
    dell=delp/((1/(2*(gamma(1))))+ (1/(2*(gamma(2))))+(1/(2*(gamma(3)))));
    lambda=lambda-dell/2;
    iter=iter+1;
    cost(iter)=(alpha(1)+beta(1)*P(1)+gamma(1)*P(1).^2)+(alpha(2)+beta(2)*P(2)+gamma(2)*P(2).^2)+(alpha(3)+beta(3)*P(3)+gamma(3)*P(3).^2);
end
P
lambda
iter

totalcost=cost(iter)
j=1:1:iter;
plot(j,cost)
grid on
xlabel('iteration')
ylabel('cost')
title('cost vs Power Gnerated')