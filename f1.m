function [A,T] = f1()

n = 100; 
%each running of simulate() will have 100 realization of poisson process
beta0 = 0.2;
beta1=0.5;
tau=3.5;
v1=1;
v2=0.5;


[X1, X2, T, C, dN,m,theta]  = simulate(n,beta0,beta1,tau,v1,v2);
A=[X1,X2,m,C];

end

