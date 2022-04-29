clc; clear all;
A=[510 310 18];
B=[7.2 7.85 7.97];
Y=[0.00142 0.00194 0.00482];
Pd=800;
lambda = input('Enter estimated value of Lambda = ');
del_P = 2; tol = 0.001;
iteration=1;
Pmin=[ 150 100 50 ];
Pmax=[ 500 400 200];
while(abs(del_P)>tol)
 F_t=0;
 for i=1:3
 P(i)=(lambda-B(i))/(2*Y(i));
 if(P(i)>Pmax(i))
 P(i)= Pmax(i);
 end
 if(P(i)<Pmin(i))
 P(i)= Pmin(i);
 end
 F(i)=Y(i)*(P(i)^2)+B(i)*P(i)+A(i);
 F_t=F_t+F(i);
 end
 sum_P=sum(P);
 del_P = sum_P-Pd;
 den=0;
 for i=1:3
 den=den+(1/(2*Y(i)));
 end
 del_lamda=abs(del_P)/den;
 if(sum_P>Pd)
 lambda=lambda-(del_lamda/2);
 end
 if(sum_P<Pd)
 lambda=lambda+(del_lamda/2);
 end
 L(iteration)=lambda;
 cost(iteration)=F_t;
 iteration = iteration + 1;
end
lambda
P
cost(iteration-1)
plot(cost)
xlabel('iteration')
ylabel('cost')
grid on