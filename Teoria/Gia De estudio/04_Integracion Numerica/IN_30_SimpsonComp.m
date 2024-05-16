function Simpson_00
  clc
  clear
  %BLOQUE DE DATOS
  disp('Ingrese el Paso')
  h=0.1
  disp('Valores de X')
  x=[0 0.1 0.2 0.3 0.4]
  disp('Valores de Y')
  y=[1 7 4 3 5]
  disp('Integracion')
  n=length(y) ;
  I=y(1)+y(n) ;
  for i=2:n-1
    if mod(i,2)~= 0
      I=I+4*y(i) ;
    else
      I=I+2*y(i) ;
    end
  end
  I=I*h/3
end
