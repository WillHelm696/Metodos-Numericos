function DerivadaSeg_00
  clc
  clear
  %BLOQUE DE DATOS
  disp('Ingrese el Paso')
  h=0.1
  disp('Valores de X')
  x=[ 0.1 0.35 0.6 0.85 1.1]
  disp('Valores de Y')
  y=[-1.60517019 0.90035575 1.97834875 2.67496214 3.19062036]
  n=length(x);
  dy(1)=2*y(1)-5*y(2)+4*y(3)-y(4);
  dy(n)=2*y(n)-5*y(n-1)+4*y(n-2)-y(n-3);
  for i=2:n-2
    dy(i)=y(i-1)-2*y(i)+y(i+1);
  end
  dy=dy*1/(h^2);
  plot(x,y)
  hold on
  plot(x,dy)
end
