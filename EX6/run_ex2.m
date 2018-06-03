clear all
close all
f = @f_nnet;
myLocalOptimAlg = @steepestdescent;

n = 6; %number of arc weights that have to be estimated
eps = 0.001;
localeps = 0.001;
max_iter = 250;
max_local_iter = 250;

%reset seed (to allow for reproducible results) 
rand('twister', 0);

% chiamo il metodo multistart
[ustar, fstar, counter, error, flocals, fstars, nstars] = ...
    multistart(f,n,eps,localeps,max_iter,max_local_iter,myLocalOptimAlg);
ustar
fstar
figure; plot(flocals,'*');
xlabel('iterations');
ylabel('flocals')
figure; 
axis([1,max_iter,0,fstars(1)+0.2])
for i = 1:(size(nstars,1)-1)
    plot([nstars(i),nstars(i+1)],[fstars(i),fstars(i)]);
    hold on;
    plot(nstars(i),fstars(i),'*');
end
plot([nstars(end),max_iter],[fstars(end),fstars(end)]);
hold on;
plot(nstars(end),fstars(end),'*');
xlabel('iterations');
ylabel('fstars')

%print the output for logical inputs
f_hmap(ustar, [0, 0])
f_hmap(ustar, [0, 1])
f_hmap(ustar, [1, 0])
f_hmap(ustar, [1, 1])
