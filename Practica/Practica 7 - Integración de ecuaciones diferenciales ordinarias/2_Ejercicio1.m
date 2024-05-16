#SED de Euler Mejorado
function S_Kuta
  clc
  clear
  w=0.5;
  x0=0; y0=[0;0;0;0;0;0];
  h=10;
  x=x0:h:7500;
  K=0.018*[-2 1 0 0 0 0;
           1 -2 1 0 0 0;
           0 1 -2 1 0 0;
           0 0 1 -2 1 0;
           0 0 0 1 -2 1;
           0 0 0 0 2/3 -2/3]
  p=0.018*[1;0;0;0;0;0];
      #Calculo
  n=length(x);
  m=rows(y0);
  y=zeros(m,n);  y(:,1)=y0;
  for i=1:n-1
    ym=y(:,i);
    k1=h*(K*ym+p);
    xg=x(i)+h/(2*w);
    yg=ym+k1/(2*w);
    k2=h*(K*yg+p);
    y(:,i+1)=ym+(1-w)*k1+w*k2;
  endfor
      #Grafica De Funcion
  plot(x,y(3,:));
  endfunction
