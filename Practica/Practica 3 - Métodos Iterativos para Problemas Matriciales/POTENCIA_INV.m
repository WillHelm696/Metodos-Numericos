#Regla de la potencia Inversa
function Potencia
  A=[-10 4; -4 0];
  B=inv(A)
  x=[2; 2]
  Tol=0.01;
  [v,$]=power(B,x,Tol)
end

function [v,$] = power(A,x,Tol)
  Err=Tol+1;
  while Err>Tol
    k=max(abs(x));
    v=x/k;
    x=A*v;
    $=min(x./v);
    Err=max(abs(A*v-$*v));
  end
end

