clear all
close all
f = @f_mdgp;

myLocalOptimAlg = @newton;

m=3;
n = 3*m;
localeps = 0.001;
eps = 0.001;

% maximum number of multistart iterations
max_iter = 150; 

% maximum number of local algorithm iterations
max_local_iter = 15;

%reset seed (to allow for reproducible results) 
rand('twister', 0);

% call the multistart method
[xstar, fstar, counter, error, flocals, fstars, nstars] = ...
    multistart(f,n,eps,localeps,max_iter,max_local_iter,myLocalOptimAlg);
xstar
fstar
error
figure; plot(flocals,'*');
xlabel('multistart iterations');
ylabel('flocals')
figure; 
axis([1,max_iter,0,fstars(1)+0.1])
for i = 1:(size(nstars,1)-1)
    plot([nstars(i),nstars(i+1)],[fstars(i),fstars(i)],'LineWidth',2);
    hold on;
    plot(nstars(i),fstars(i),'o','LineWidth',2);
end
plot([nstars(end),counter],[fstars(end),fstars(end)],'LineWidth',2);
hold on;
plot(nstars(end),fstars(end),'o','LineWidth',2);
xlabel('multistart iterations');
ylabel('fstars')
figure; 
plot3([xstar(1),xstar(4),xstar(7),0],[xstar(2),xstar(5),xstar(8),0],...
    [xstar(3),xstar(6),xstar(9),0],'-*');
text(xstar(1)-0.05,xstar(2)-0.05,xstar(3)-0.05,'x^*_1','Color',[0 0 1])
text(xstar(4)-0.05,xstar(5)-0.05,xstar(6)-0.05,'x^*_2','Color',[0 0 1])
text(xstar(7)-0.05,xstar(8)-0.05,xstar(9)-0.05,'x^*_3','Color',[0 0 1])
text(0.1,0.1,0.1,'x^*_4','Color',[0 0 1])
nstars
fstars
counter
