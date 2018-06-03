% Gradient of a function at a point
function gradf = grad(f, x)
h = 0.0001;
n = length(x);
gradf = zeros(n,1);
    for i = 1:n
        delta = zeros(n, 1); delta(i) = h;
        gradf(i) = ( feval(f, x+delta) - feval(f,x) ) / h;
    end
end %of function