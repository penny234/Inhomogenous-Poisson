function [X1, X2, T, C, dN,m,theta]=simulate(n,beta0,beta1,tau)

X1= unifrnd(0,1,n,1); X2=repmat(binornd(1,0.5),[n,1]); 
%X1 is uniform(0,1), X2 is bernoulli (0,0.5)
C=rand(0,tau);  
%C is the censoring time which follows random uniform (0,tau)
[T,dN,m]=poisson(C, X1, X2, beta0,beta1,tau);
% [T,dN,m] is output of poisson function, 
%where  T=observed event time, dN=counting increment (either 0 or 1) , m=total number of events observed]


