%Algoritmo del el metodo de BISECCI‡N
function Biseccion
  clc
  clear
  f=@(x) x-2^-x;
  Tol=0.001;
  a=0
  b=2
  ya=feval(f,a);
  yb=feval(f,b);
  Itr=0;
  if ya*yb<0
    r=(a+b)/2;
    yr=feval(f,r);
    while abs(yr)>Tol
      if ya*yr<0 ;
        b=r;
        yb=yr;
      else ya*yr<0 ;
        a=r;
        yb=yr;
      end
      r=(a+b)/2;
      yr=feval(f,r);
      Itr=Itr+1;
    end
    c=r;
  else
    c='No Hay raizes';
  end
  disp('Iteraciones:');Itr
  disp('Raiz Aproximado:');c
  disp('Orden de Error');yr
end
