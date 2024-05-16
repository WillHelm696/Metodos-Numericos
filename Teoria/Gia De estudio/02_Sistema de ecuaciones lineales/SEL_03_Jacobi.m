#Ejemplo Metodo de jacobi
function M_Jacobi
  clc;
  clear;
  x=[1.5;2.5;2.5;1.5]
  Tol=0.01 ;

  D=[50 0 0 0;
      0 50 0 0;
      0 0 50 0;
      0 0 0 50;] ;

  B=[0 -25 0 0;
    -25 0 -25 0;
    0 -25 0 -25;
    0 0 -25 0; ] ;

  b=[10;20;20;10];
  T=-inv(D)*B ;
  c=inv(D)*b ;

  Err=min(x)
  while abs(Err)>Tol
    s=T*x+c;
    Err=min(x-s);
    x=s
  end
end
