#Metodo de Punto Fijo o Regla Falsa
function Fijo
  clc
  clear
  f=@(x) x^2-3;
  g=@(x) x-1/3*(x^2-3) ;
  x=2;
  Tol=0.001;

  r=feval(g,x);
  yr=feval(f,r);
  Itr=0;
  while abs(yr)>Tol
    x=r;
    r=feval(g,x);
    yr=feval(f,r);
    Itr=Itr+1;
  endwhile
  disp('Iteraciones:');Itr
  disp('Raiz Aproximado:');x
  disp('Orden de Error');yr
end
