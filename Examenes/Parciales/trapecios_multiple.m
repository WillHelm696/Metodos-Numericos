function trapecios_multiple
  h = 0.4;
  x = [0.2:h:1]
  %y = [46.36, 55.86, 58.9, 60.42, 61.56]
  y = [46.36, 58.9, 61.56]
  
  c1 = y(1)/2;
  cn = y(length(x))/2;
  sum = 0;
  
  for i=2:length(x)-1
    sum += y(i);
  endfor
  I = h*(c1+sum+cn)
endfunction  