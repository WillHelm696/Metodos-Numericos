# En un sistema la incêgnita primaria es la solucion
# de la siguiente EDO de segundo orden
function SEL_RK
  clc
  clear
  x0=0; #Punto Inicial
  y0 =[ 0;0]
  f  =[ 0 1 ; -4 -0.5 ]
  h=0.01;
  w=0.5;
  x=x0:h:10;
      #Calculo
  n=length(x);
  y=zeros(2,n);  y(:,1)=y0;
  for i=1:n-1
    yn=y(:,i);
    k1=h*(f*yn + sin(5*x(i))*[0;3]);
    xg=x(i)+h/(2*w);
    yg=yn+k1/(2*w);
    k2=h*(f*yg + sin(5*xg)*[0;3]);
    y(:,i+1)=yn+(1-w)*k1+w*k2;
  endfor
      #Grafica De Funcion
  plot(x,y(1,:));
  hold on
  plot(x,y(2,:))
       #Funcion Original
  u=@(t) (-1/7)*(-(5/2)*sin(2*t)+sin(5*t))
  v=@(t) (-1/7)*5*(-cos(2*t)+cos(5*t))
  plot(x,feval(u,x),'LineWidth',0.5,'--b');
  hold on
  plot(x,feval(v,x),'LineWidth',0.5,'--r')
  hold off
endfunction
