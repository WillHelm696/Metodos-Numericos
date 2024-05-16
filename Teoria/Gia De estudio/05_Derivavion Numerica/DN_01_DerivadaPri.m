function DerivadaPri_00
  clc
  clear
  %BLOQUE DE DATOS
  disp('Ingrese el Paso')
  h=pi/101
  disp('Valores de X')
  x=0:h:pi;
  disp('Valores de Y')
  y=cos(x);
  n=length(x);
  dy(1)=-3*y(1)+4*y(2)-y(3);
  dy(n)= 3*y(n)-4*y(n-1)+y(n-2);
  for i=2:n-2
    dy(i)=y(i+1)-y(i-1);
  end
  dy=dy*1/(2*h);
  plot(x,y)
  hold on
  plot(x,dy)
end
