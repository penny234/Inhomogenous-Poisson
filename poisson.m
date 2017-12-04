function   [obsT,dN,m]=poisson(C, X1, X2, beta0,beta1,theta,tau)

[n, k]=size(C);

obst = zeros(n, 100);

m= zeros(n, 1);
% SI = unifrnd(1,3.5,n,1) %editting


 
for i=1:n
    S = zeros(1, 100);
 lmt = exp(theta*(abs(beta0)  + abs(beta1))*theta) ; mn=0;t=-log(rand) / lmt;

    while t < tau
            if rand < exp(theta*(beta0 * X1(i) + beta1*X2(i))) / lmt, mn=mn+1; S(mn)=t; end

            t=t-log(rand) / lmt;
    end

%lmt2 = exp( 0.2  + beta* X2(i) + 0.5* X3(i) ); t= SI(i)-log(rand) / lmt2;

%     while t<tau
%                if rand < exp( 0.2*cos(t)* X1(i)+ beta* X2(i) + 0.5*sin(t-SI(i)) * X3(i) )/ lmt2, mn=mn+1; S(mn)=t; end

%    t=t-log(rand) / lmt2;
%    end

obst(i, 1:mn)  = sort(S(1:mn), 1) .* (sort(S(1:mn),1) <=C(i));
end

dN=double(obst>0);
tn=max(sum(dN, 2));
obsT=obst(:, 1:tn);
dN=dN(:, 1:tn);
m=sum(dN, 2);
end



