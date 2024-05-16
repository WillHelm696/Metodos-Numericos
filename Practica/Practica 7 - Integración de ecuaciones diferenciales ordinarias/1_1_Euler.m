#EDO Metodo de Euler
function Euler
  clc
  clear
  x0=0; y0=2; #Punto Inicial
  h=0.1; # Paso Delta
  x=x0:h:1 #Valores de X en [0,1]
  f=@(x) exp(2*x)+x+1; #Funcion Original
  m=@(x,y) 2*y-2*x-1; #Derivada
      #Calculo
  n=length(x);
  y=zeros(1,n);  y(1)=y0;
  for i=1:n-1
    ym=feval(m,x(i),y(i)); #Evalua en la derivada
    y(i+1)=y(i)+h*(ym);
  endfor
        #Grafica De Funcion
  plot(x,y,'LineWidth',1,'--r')
  hold on
  g=feval(f,x)
  plot(x,g)
  hold off
endfunction

