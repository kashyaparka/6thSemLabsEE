clc; 
clear all;
alpha = [510; 310; 18];
beta = [7.2; 7.85; 7.97];
gamma = [0.00142; 0.00194; 0.00482];
PD=800;
delp=10;		
lamda=2;
disp(['	lambda       p1      p2        p3         DP     delambda  totalcost'])
iter=0;	
Pmin=[ 150 100 50 ];
Pmax=[ 500 400 200];
while abs(delp)>=0.001
    iter=iter+1;
    P=(lamda-beta)./(2*gamma);	
    for i=1:3
    if P(i)>Pmax(i)
        P(i)=Pmax(i);
    end
    if P(i)<Pmin(i)
        P(i)=Pmin(i);
    end
    end
    delp=PD-sum(P);  
    J=sum(ones(length(gamma),1)./(2*gamma)); 
    delamda=delp/J;
    totalcost(iter)=sum(alpha+beta.*P+gamma.*P.^2);
    disp([lamda,P(1),P(2),P(3), delp, delamda, totalcost(iter)])
    lamda=lamda+(delamda/2); 	
end
grid on
 plot(totalcost)