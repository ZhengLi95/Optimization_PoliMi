% Polak-Ribiere conjugate gradient method
function [xstar, fstar, counter, error, xks, fks] = ...
    cg_pr(f, x0, epsilon, maxiterations)

  x = x0;

  counter = 0;  error = 1e300;

  xks = [x'];
  fks = [feval(f, x)];

  gradF = grad(f, x);
  
  d = -gradF;

  while error > epsilon && counter < maxiterations

    counter = counter + 1;
 
    alpha = fminsearch(@(a) feval(f,x + a*d), 0.0);

    x = x + alpha * d;

    xks = [xks; x'];
    fks = [fks; feval(f, x)];

    gradFp = gradF;
    
    gradF = grad(f, x);

    error = norm(gradF);
    
    beta = gradF'*(gradF-gradFp)/(gradFp'*gradFp);

    
    d = -gradF + beta * d;

  end

  xstar = x;
  fstar = feval(f, x);


end
