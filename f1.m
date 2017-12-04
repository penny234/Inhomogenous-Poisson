function [A,T] = f1()

n = 100; 
%each running of simulate() will have 100 realization of poisson process

beta0 = 0.2;%initalize the parameter beta0, beta1, and maxium observation time
beta1=0.5;
tau=3.5;



[X1, X2, T, C, dN,m]  = simulate(n,beta0,beta1,tau);
A=[X1,X2,m,C];

end

