clc
clear all;
close all;

%total load demand
PD=800;

alpha=[510;310;18];
beta=[7.2; 7.85; 7.97];
gamma=[0.00142; 0.00194; 0.00482];

Pmin=[150;100;50];
Pmax=[500;400;200];

B=[0.000218 0.000093 0.000028
    0.000093 0.000228 0.000017
    0.000028 0.000031 0.000015];

Bo=[0.0003 0.0031 0.0015];

Boo = 0.00030523;

delP=10;
lamda=input('Enter estimated value of Lambda = ');
tol=0.01;

iteration=0;

while abs(delP)>tol
    
    iteration=iteration+1;
    
    for i=1:3
        P(i) = (lamda - beta(i))/(2*(gamma(i) + lamda*B(i,i)));  
     if P(i)<=Pmin(i) 
          P(i)=Pmin(i);
     elseif P(i)>=Pmax(i) 
          P(i)=Pmax(i);    
     end

     end
    Ploss_one=0;
    for i=1:3
        for j=1:3
            
          Ploss_one= Ploss_one + P(i)*B(i,j)*P(j);
        end
    end
    Ploss_two=0;
    for i=1:3
        Ploss_two=Ploss_two + P(i)*Bo(i);
    end
    
    Ploss_total= Ploss_one + Ploss_two + Boo;
    
    
    
    
    delP=(PD + Ploss_total)-sum(P);
    
    den=0;
    for i=1:3
        den= den + (gamma(i)+ beta(i)*B(i,i))/(2*(gamma(i)+ lamda*B(i,i))^2); 
    end
        Delamda = delP/den;
        
        disp([lamda,P(1),P(2),P(3),delP,Delamda])
     lamda = lamda + Delamda/2;
   
      totalcost = 0;
     for i=1:3
         cost(i) = alpha(i) + beta(i)*P(i) + gamma(i)*P(i)^2;
          totalcost =  totalcost +cost(i);
     end
    
     tcost(iteration) = totalcost;
end
plot(tcost) 
xlabel('Iteration');
ylabel('Total Cost');
grid on

Ploss_total
P
lamda
delP
Delamda
totalcost