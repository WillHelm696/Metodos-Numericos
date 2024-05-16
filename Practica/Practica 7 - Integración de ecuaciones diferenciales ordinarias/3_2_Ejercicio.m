%Diferencia Central Matricial Con Valores Inciciales
function SD_Central
  clc
  clear
  y0=[1;2;1]
  dy0=[1;4;0]
  h=0.001 ;x=0:h:2 ;
  M=[1 0 0 ; 0 -1 0; 0 0 2]
  C=[4 0 0 ; 0 -1 0; 0 0 3]
  K=[0 4 1 ; 4 2 0; 1 0 1]
      #Calculo
  G=inv(M+(h/2)*C);
  D=G*(2*M-(h^2)*K);
  H=G*((h/2)*C-M);
  R=fun_ind(x(1));

  n=length(x);
  m=rows(y0);
  y=zeros(m,n); y(:,1)=y0;
  d2y0=inv(M)*( R - K*y0 - C*dy0 );
  y_ant=y0-h*dy0+(h/2)*d2y0
  for i=1:n-1
    yi=y(:,i);
    R=fun_ind(x(i));
    b=(h^2)*G*R;
    y(:,i+1)=b+D*yi+H*y_ant;
    y_ant=y(:,i);
  endfor
      #Grafica
  plot(x,y(1,:));
  hold on
  plot(x,y(2,:));
  plot(x,y(3,:));
  hold off
end

function r=fun_ind(x);
  r(1,1)= 5*exp(x) +8*exp(2*x) +cos(x);
  r(2,1)=-8*exp(2*x)+4*exp(x);
  r(3,1)=-cos(x) -3*sin(x) +exp(x);
end
