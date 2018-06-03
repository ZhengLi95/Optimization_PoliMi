% Gauss-Newton method
function [xk, fk, counter, error, xks, fks] = ...
    gaussnewton(r, x0, epsilon, maxiterations)

  xks = [x0'];
  fks = [norm(feval(r,x0))^2];

  xk = x0;
  counter = 0;
  error = 1e300;

  while error > epsilon && counter < maxiterations

    counter = counter + 1;
    
    J = jac(r, 6, xk);
    d = -pinv(J)*feval(r,xk)';
    alpha = 1;
    xk = xk + alpha * d;
    
    fk = norm(feval(r,xk))^2;
    error = fk;

  xks = [xks; xk'];
  fks = [fks; fk];
  end  
  
end
