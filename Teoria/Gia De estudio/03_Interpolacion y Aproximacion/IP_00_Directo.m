function Directo_00
  clc
  clear
  %BLOQUE DE DATOS
  x=[3;7];
  y=[5;-1]
  A=[x.^0 x.^1]
  %BLOQUE DE OPERACION
  a=inv(A)*y
  plot(x,y)
end
