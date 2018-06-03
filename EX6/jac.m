% Jacobian of a vector function at a point
function J = jac(r, m, x)
  n = length(x);
  J = zeros(m,n);
  h = 0.0001;
  
  for i = 1:m
   for j = 1:n
     delta = zeros(n, 1); delta(j) = h;
     rd=r(x+delta);
     rx=r(x);
     J(i,j) = (rd(i)  -  rx(i)) / h;
   end
  end
end %end of function
