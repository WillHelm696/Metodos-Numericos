%EDO central Con Valores Inciciales
function D_Central
  clc
  clear
  h=0.01; g=9.8 ; L=1 ;y0=0; dy0=2
  x=0:h:10;
      #Calculo
  n=length(x);
  y=zeros(1,n);
  y_ant = y0 - h*dy0 + (h^2/2)*(-(g/L)*y0);
  for i=1:n-1
    y(i+1)=(2-(h^2)*g/L)*y(i) - y_ant;
    y_ant=y(i);
  end
      #Grafica
  plot(x,y);
end
