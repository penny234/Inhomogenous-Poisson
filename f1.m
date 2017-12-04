function [A,T] = f1()
%   Summary of this function goes here
%   Detailed explanation goes here
n = 2; %each cluster has twins, so in each cluster n=2
beta0 = 0.2;
beta1=0.5;
tau=3.5;
v1=1;
v2=0.5;


[X1, X2, T, C, dN,m,theta]  = simulate(n,beta0,beta1,tau,v1,v2);
A=[X1,X2,m,C];

end

