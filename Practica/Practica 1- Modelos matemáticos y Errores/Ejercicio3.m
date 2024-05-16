%Serie de McLaurin De la exponencial
function Taylor
  clc
  x=2;
  tol=0.1;
  n=1;
  f=1;
  fact=1;
  var=1;
  while var>tol
    fact=fact*n;
    var=(x^n)/fact;
    f=f+var;
    vec(n)=f;
    n=n+1;
  endwhile
  vec
  disp(f)
end

