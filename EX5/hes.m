% Hessian of a function at a point
function H = hes(f, x)

  h = 0.0001;
  n = length(x);
  H = zeros(n,n);

  for i = 1:n
    delta_i = zeros(n, 1); delta_i(i) = h;
    for j = 1:n
      delta_j = zeros(n, 1); delta_j(j) = h;
      H(i,j) = (feval(f,x+delta_i+delta_j) - feval(f,x+delta_i) ...
          - feval(f,x+delta_j) + feval(f,x)) / (h^2);
    end
  end

end %end of function
