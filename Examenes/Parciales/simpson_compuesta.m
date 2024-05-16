function simpson_compuesta
  h = 0.2;
  x = [0.2:h:1]
  y = [46.36, 55.86, 58.9, 60.42, 61.56]
  %y = [46.36, 58.9, 61.56]
  sum = 0;
  
  for i=1:length(x)
    if i == 1 || i == length(x)
      sum += y(i);
    elseif mod(i,2) == 0
      sum += 2*y(i);
    else
      sum += 4*y(i);
    endif
  endfor
  I = (h/3)*sum
endfunction  