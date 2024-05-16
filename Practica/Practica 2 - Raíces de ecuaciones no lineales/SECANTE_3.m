#Metodo de SEcante o Regla Falsa
function Secante
  clc
  clear
  f=@(x) x-2^-x;
  Err=0.001;
  a=1.5
  b=2
  ya=feval(f,a);
  yb=feval(f,b);
  Itr=0
  if ya*yb>0
    while abs(ya) > Err
      m=(ya-yb)/(a-b);
      r=a-ya/m;
      y=feval(f,r);
      b=a;
      yb=ya;
      a=r;
      ya=y;
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

