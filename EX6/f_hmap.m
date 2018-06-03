function f = f_hmap(u, y)
     f = f_act(u(5)* f_act(u(1)*y(1) + u(2)*y(2)) ... 
             + u(6)* f_act(u(3)*y(1) + u(4)*y(2)));
end

function f = f_act(xi)
  f = (exp(xi) - exp(-xi)) / (exp(xi) + exp(-xi));
end