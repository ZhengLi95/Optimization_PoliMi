f = @f_ex1_4;

[X,Y] = meshgrid(-4:.01:4, -1:.01:1);
Z = zeros(size(X,1),size(X,2));

for i = 1:size(X,1)
    for j = 1:size(X,2)
       Z(i,j) = feval(f,[X(i,j);Y(i,j)]); 
    end
end
        
figure; contour(X,Y,Z,30);

x0 = [4; 1];
eps = 0.001;
max_iter = 100;

[xstar, fstar, counter, error, xks, fks ] = steepestdescent(f, x0, eps, max_iter);
counter
hold on; plot(xks(:,1), xks(:,2), 'r');
hold on; plot(xks(:,1), xks(:,2), 'r*');

[xstar, fstar, counter, error, xks, fks ] = cg_fr(f, x0, eps, max_iter);

hold on; plot(xks(:,1), xks(:,2), 'g');
hold on; plot(xks(:,1), xks(:,2), 'g*');

[xstar, fstar, counter, error, xks, fks ] = newton(f, x0, eps, max_iter);

hold on; plot(xks(:,1), xks(:,2), 'b');
hold on; plot(xks(:,1), xks(:,2), 'b*');
