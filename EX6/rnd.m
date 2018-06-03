function xrnd = rnd(n, bound)
  xrnd = zeros(n,1);
  for i = 1:size(xrnd,1)
    xrnd(i) = (rand()-0.5)*2*bound;
  end
end 
