% Stub of a descent method
function [xk, fk, counter, error, xks, fks] = ...
    newton(f, x0, epsilon, maxiterations)
xks = [x0'];
fks = [feval(f,x0)];
xk = x0;
counter = 0;
error = 1e300;
    while error > epsilon && counter < maxiterations
        counter = counter + 1;
        d = -inv(hess(f,xk))*grad(f,xk);
        alpha = 1; %newton with unitary step-size
        xk = xk + alpha*d;
        error = norm(grad(f,xk));
        fk = feval(f,xk);
        xks = [xks; xk'];
        fks = [fks; fk];
    end
counter
end %of function