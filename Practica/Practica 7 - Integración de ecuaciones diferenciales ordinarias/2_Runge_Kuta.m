#SED de Runge-Kutta
function S_RungeK
  clc
  clear
  x0=0; y0=[0;2]; #Punto Inicial
  h=0.1; L=1; g=9.8; w=0.5;
  x=x0:h:10;
  A=[0 1;-(g/L) 0]
      #Calculo
  n=length(x);
  m=rows(y0);
  y=zeros(m,n);  y(:,1)=y0;
  for i=1:n-1
    ym=y(:,i);
    k1=h*(A*ym);
    #xg=x(i)+h/(2*w);
    yg=ym+k1/(2*w);
    k2=h*(A*yg); #Evalua en la derivada
    y(:,i+1)=ym+(1-w)*k1+w*k2;
  end
        #Grafica De Funcion
  plot(x,y);
end
