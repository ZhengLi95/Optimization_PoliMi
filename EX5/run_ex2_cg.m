clear all
close all
f = @f_rosenbrock;

[X,Y] = meshgrid(-3:.01:3, -5:.01:6);
        
Z = zeros(size(X,1),size(X,2));

for i = 1:size(X,1)
    for j = 1:size(X,2)       
        Z(i,j) = feval(f,[X(i,j);Y(i,j)]);        
    end    
end

%plot the function
%figure;
%surf(X,Y,Z,'FaceColor','interp','EdgeColor','none')
%camlight left; lighting phong
%hold on;
%plot3(1,1,0,'*y');

%plot the contour of the function
figure; contour(X,Y,Z,50);
hold on; 

%optimize --for 500 iterations, starting rfom [-2;2]. Change the code for
%           the other cases
eps = 0.001;

x0 = [-2; 2];
max_iter = 50;

plot(x0(1),x0(2),'o');
plot(1,1,'b*');
[xstar, fstar, counter, error, xks, fks ] = cg_fr(f, x0, eps, max_iter);
%[xstar, fstar, counter, error, xks, fks ] = cg_pr(f, x0, eps, max_iter);
counter
error
gap = norm(xstar-[1; 1])
fstar
plot(xks(1:50,1), xks(1:50,2), 'r');
plot(xks(51:end,1), xks(51:end,2), 'b');
%plot(xks(:,1), xks(:,2), 'r*');


plot(1,1,'ko');
