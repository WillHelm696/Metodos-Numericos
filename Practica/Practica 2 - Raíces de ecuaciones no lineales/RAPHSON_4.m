%metodo de Newton-Raphson
function Raphson
  clc
  clear
  f=@(x) x-2^(-x);
  df=@(x) 1+log(2)*2^(-x);
  Tol=0.001;
  a=2;
  y=f(a);
  Itr=0;
  if y~=0
    while abs(y) > Tol
      dy=df(a);
      r=a-y/dy;
      a=r;
      y=f(a);
      Itr=Itr+1;
    end
    x=a;
  else
    x='No Hay ceros';
  end
  disp('Iteraciones:');Itr
  disp('Raiz Aproximado:');x
  disp('Orden de Error');y
end
