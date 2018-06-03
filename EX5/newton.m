% Newton method
function [xk, fk, counter, error, xks, fks] = ...
    newton(f, x0, epsilon, maxiterations)

  xks = [x0'];
  fks = [feval(f,x0)];
  xk = x0;
  counter = 0;
  error = 1e300;

  while error > epsilon && counter < maxiterations

    counter = counter + 1;
    gradF = grad(f, xk);
    H = hes(f, xk);
    d = -inv(H)*gradF;
    alpha = 1;
    xk = xk + alpha * d;
    
    error = norm(grad(f,xk));
    fk = feval(f,xk);

  xks = [xks; xk'];
  fks = [fks; fk];
  end
  
end
