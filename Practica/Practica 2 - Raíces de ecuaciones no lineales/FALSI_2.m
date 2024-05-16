#Metodo de Regula Falsi o Regla Falsa
function Falsi
  clc
  clear
  f=@(x) x-2^-x;
  Tol=0.001;
  a=0;
  b=2;
  ya=feval(f,a);
  yb=feval(f,b);
  Itr=0;
  if ya*yb<0
    m=(ya-yb)/(a-b);
    r=a-ya/m;
    y=feval(f,r);
    while abs(y)>Tol
      if ya*y<0
        b=r;
        yb=y;
      else yb*y<0
        a=r;
        ya=y;
      endif
      m=(ya-yb)/(a-b);
      r=a-ya/m;
      y=feval(f,r);
      Itr=Itr+1;
    endwhile
    x=r;
  else
    x='No Hay ceros';
  end
  disp('Iteraciones:');Itr
  disp('Raiz Aproximado:');x
  disp('Orden de Error');y
end
