f = @f_rosenbrock;

%plot the contour of the function
[X,Y] = meshgrid(-3:.01:3, -10:.01:5);
Z = zeros(size(X,1),size(X,2));

for i = 1:size(X,1)
    for j = 1:size(X,2)       
        Z(i,j) = feval(f,[X(i,j);Y(i,j)]);        
    end    
end

figure; contour(X,Y,Z,50);
hold on;

%optimize
x0 = [-1; 0];
eps = 0.001;
max_iter = 50;

%newton
[xstar, fstar, counter, error, xks, fks ] = newton(f, x0, eps, max_iter);
counter
error
gap = norm(xstar-[1; 1]) 
fstar   
plot(xks(:,1), xks(:,2), 'b');
plot(xks(:,1), xks(:,2), 'b*');
