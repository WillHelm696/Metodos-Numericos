function TrapeciosComp_10
  clc
  clear
  %BLOQUE DE DATOS
  disp('Ingrese el Paso')
  h=0.1
  disp('Valores de X')
  x=[0 0.1 0.2 0.3 0.4]
  disp('Valores de Y')
  y=[1 7 4 3 5]
  %BLOQUE DE OPERACION
  n=length(x);
  I= y(1) + y(end) ;
  for n=2:n-1
    I= I + 2*y(n);
  end
  I=I*h/2;
  disp('Integracion'); disp(I);
end
