function   [obsT,dN,m]=poisson(C, X1, X2, beta0,beta1,tau)
%this function needs to input censoring time, X1, X2, beta0, beta1, tau 
% output of this function is realization of n poisson process. 


%C is censoring time
%X1 is a random number ~ Bernoulli(0,p)
%X2 is a random numver ~ Uniform (0,1)
%tau is the maxium observational time
[n, k]=size(C);

obst = zeros(n, 100);

m= zeros(n, 1);



 
for i=1:n
    S = zeros(1, 100);  % maximum event occurrence of a single realization is 100. 
 lmt = exp(abs(beta0)  + abs(beta1)) ; 
 %lmt is the constant upper bound of the nonhomogenous poisson process rate lambda=exp(beta0*x1+beta1*x2)
 %which you want to generate data from
 mn=0;
 t=-log(rand) / lmt;
 % thinning method, initalize the event time as -log(rand)/lmt, where rand is a random number from Uniform(0,1)

    while t < tau  
    % when event time < tau ,where observation period is from 0 to tau
            if rand < exp((beta0 * X1(i) + beta1*X2(i)) / lmt, mn=mn+1; 
            S(mn)=t; 
            end
     % by accepting-rejection critiera, if an independent random number from Uniform(0,1) is smaller than lambda/lmt, 
     %then update the event time as t-log(rand)/lmt; else not update
            t=t-log(rand) / lmt;
    end


obst(i, 1:mn)  = sort(S(1:mn), 1) .* (sort(S(1:mn),1) <=C(i));
%sort the observed time, only keep those smaller than the censoring time 
end

dN=double(obst>0);
tn=max(sum(dN, 2));
obsT=obst(:, 1:tn);
dN=dN(:, 1:tn);
m=sum(dN, 2);
end



