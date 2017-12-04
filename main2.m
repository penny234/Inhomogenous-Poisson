clear all
tic


i=0;

while i<100
       [A,T]=f1();
       dlmwrite(sprintf('time%d.txt', i), T,'delimiter','\t','precision','%.6f');
       dlmwrite(sprintf('A%d.txt', i), A,'delimiter','\t','precision','%.6f');
       i=i+1;
       
end


    

%dlmwrite('/Users/Penny/Desktop/time.txt',T,'delimiter','\t','precision','%.6f')
%dlmwrite('/Users/Penny/Desktop/test.txt',A,'delimiter','\t','precision','%.6f')
