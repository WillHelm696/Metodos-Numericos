#SED de Euler Mejorado
function S_Euler
  clc
  clear
  x0=0; y0=[0;2]; #Punto Inicial
  h=0.1; L=1; g=9.8;
  x=x0:h:10;
  A=[0 1;-(g/L) 0]
      #Calculo
  n=length(x);
  m=rows(y0)
  y=zeros(m,n);  y(:,1)=y0;
  for i=1:n-1
    ym=y(:,i);
    dy=(A*ym);
    y(:,i+1)=ym+(h*dy);
  endfor
      #Grafica De Funcion
  plot(x,y(1,:));
  hold on
  plot(x,y(2,:));
  hold off
  endfunction
