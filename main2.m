clear all
tic

N=1000;  % do 1000 simulations
i=1;

while i<=N
       [A,T]=f1();
       dlmwrite(sprintf('time%d.txt', i), T,'delimiter','\t','precision','%.6f'); 
       % record the results as time1.txt, time2.txt,...., time1000,  in your current path 
       % record the results as A1.txt, A2.txt,...., A1000.txt,  in your current path 
       dlmwrite(sprintf('A%d.txt', i), A,'delimiter','\t','precision','%.6f');
       i=i+1;
       
end

