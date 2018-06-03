function f = f_nnet(u)
  y = [ 0.1  0.1  ;
        0.9  0.9  ;
        0.0  0.95 ;
        0.95 0.1  ];
  z = [ 0.1  0.05  0.98  0.95 ]';
  f = 0;
  for i = 1:length(z)
    f = f + ( z(i) - f_hmap(u, [y(i,1) y(i,2)]') )^2;
  end
end