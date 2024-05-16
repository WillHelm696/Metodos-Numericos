function DerivadaSeg_02
  clc
  clear
  %BLOQUE DE DATOS
  disp('Ingrese el Paso')
  h=pi/101
  disp('Valores de X')
  x=0:h:pi ;
  disp('Valores de Y')
  y=sin(x) ;
  n=length(x);
  dy(1)=2*y(1)-5*y(2)+4*y(3)-y(4);
  dy(n)=2*y(n)-5*y(n-1)+4*y(n-2)-y(n-3);
  for i=2:n-2
    dy(i)=y(i-1)-2*y(i)+y(i+1);
  end
  dy=dy*1/(h^2);
  plot(x,y,'r')
  hold on
  plot(x,dy,'b')
end
