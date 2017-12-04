function [X1, X2, T, C, dN,m,theta]=simulate(n,beta0,beta1,tau,v1,v2)

X1= unifrnd(0,1,n,1); X2=repmat(binornd(1,0.5),[n,1]); %X2 is the I(monozygotic twins indicator)

if X2== repmat(1,[n,1]) 
    theta=gamrnd(1/v1,v1);
else
    theta=gamrnd(1/v2,v2);
end
 
%in the same cluster, the theta follows the same frailty distribution
C=min(unifrnd(2.5,8,n,1),repmat(tau, n, 1));  
[T,dN,m]=poisson(C, X1, X2, beta0,beta1,theta,tau);



