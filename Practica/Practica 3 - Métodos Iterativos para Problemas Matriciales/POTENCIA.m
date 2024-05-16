#Regla de la potencia
function Potencia
  A=[ 22 -11 0 0; -11 44 -11 0; 0 -11 44 -11; 0 0 -11 22]
  x=[-1; 2; 2; -1]
  Tol=0.1;
  [v,$]=power(A,x,Tol)
end

function [v,$] = power(A,x,Tol)
  Err=Tol+1;
  while Err>Tol
    k=max(abs(x));
    v=x/k
    x= A*v
    $=min(x./v)
    Err=max(abs(A*v-$*v))
  end
end

