clear all
close all
r = @r_mdgp;

n = 9;
fsol = 0;
eps = 0.001;
max_iter = 100;

x0 = zeros(n,1);

[xstar,fstar,counter,error,xks,fks] = gaussnewton(r, x0, eps, max_iter);
fks
xstar
fstar
counter
plot(fks,'*');
xlabel('iterations');
ylabel('fks');


figure; 
plot3([xstar(1),xstar(4),xstar(7),0],[xstar(2),xstar(5),xstar(8),0],...
    [xstar(3),xstar(6),xstar(9),0],'-*');
text(xstar(1)-0.05,xstar(2)-0.05,xstar(3)-0.05,'x^*_1','Color',[0 0 1])
text(xstar(4)-0.05,xstar(5)-0.05,xstar(6)-0.05,'x^*_2','Color',[0 0 1])
text(xstar(7)-0.05,xstar(8)-0.05,xstar(9)-0.05,'x^*_3','Color',[0 0 1])
text(0.1,0.1,0.1,'x^*_4','Color',[0 0 1])
