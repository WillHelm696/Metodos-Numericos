function Directo_01
  clc
  clear
  %BLOQUE DE DATOS
  x=[3;7;9];
  y=[5;-1;2]
  P=[x.^0 x.^1 x.^2]
  %BLOQUE DE OPERACION
  A=inv(P)*y
  D=0:0.1:10;
  I=polyval(flipud(A),D);
  plot(D,I)
  hold on
  plot(x,y,'o')
  hold off
end
