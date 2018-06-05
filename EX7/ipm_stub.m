% interior point method for LPs of the form min c'*x : A*x <= b

function [xstar, vstar] = ipm(c, A, b, mu, x_init, gamma, epsilon)

  OPTIONS = [];
  [m, n] = size(A);
  
  %%bring to standard form
  s = b - A*x_init
  x = [ x_init ; s ]

  A = [A eye(m,m)]
  c = [c zeros(1,m)]
  %[m, n] = size(AA)



  grad = zeros(m+n, 1);
  H = zeros(m+n, m+n);
  d = zeros(m+n, 1);
  z = zeros(m, 1);
  
  xks = [x_init']

  %% iterative method
  while n * mu >= epsilon
    %% compute gradient and Hessian
	
	
    %% compute direction d with adapted Newton update
    

    alpha = fminbnd(@(alpha) % write here the objective function f(x+alpha*d), ...
            0, 1, OPTIONS);
    xstar = x + alpha * d;
    mu = gamma * mu;
    x = xstar;
    xks = [xks; x(1:n)']
  end
  

polyhedron_print(A,b); hold on;
plot(xks(:,1), xks(:,2), 'r.');

end % end of function

