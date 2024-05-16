#EDO Metodo de Runge-Kutta
function Runge_K
  clc
  clear
  x0=0; y0=4; #Punto Inicial
  h=0.1;
  w=0.5;
  x=x0:h:10;
  f=@(x) 6*exp(-x/2)+x-2; #Funcion Original
  m=@(x,y) -0.5*y+0.5*x; #Derivada de la funcion
      #Calculo
  n=length(x);
  y=zeros(1,n);  y(1)=y0;
  for i=1:n-1
    k1=h*feval(m,x(i),y(i)); #Evalua en la derivada
    xg=x(i)+h/(2*w);
    yg=y(i)+k1/(2*w);
    k2=h*feval(m,xg,yg); #Evalua en la derivada
    y(i+1)=y(i)+(1-w)*k1+w*k2;
  endfor
      #Grafica De Funcion
  plot(x,y,'LineWidth',1,'--r');
  hold on
  g=feval(f,x);
  plot(x,g)
  hold off
endfunction
