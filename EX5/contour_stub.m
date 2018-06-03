f = @myFunction;
%plot the contour of the function
[X,Y] = meshgrid(x_lb:x_step:x_ub, y_lb:y_step:y_ub);
Z = zeros(size(X,1),size(X,2));
for i = 1:size(X,1)
    for j = 1:size(X,2)
       Z(i,j) = feval(f,[X(i,j);Y(i,j)]); 
    end
end        
figure; contour(X,Y,Z,50);
hold on; 