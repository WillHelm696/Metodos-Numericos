function Diferencia_00
  clc
  clear
  %BLOQUE DE DATOS
  h=0.001;
  x=0:h:5 ;
  M=[16 0;0 32]
  K=[4 4;9 0]
  %BLOQUE DE ITERACIONES
  n=length(x);
  y=zeros(2,n) ;
  R0=R(x(1)) ;
  U0=[pi/8;-pi/4]
  dU0=[0.1;-0.2]
  d2U0=inv(M)*(R0-K*U0)
  U_ant=U0-h*dU0+(h^2/2)*d2U0
  y(:,1)=U0;
  for i=1:n-1
    Ui=y(:,i) ;
    Ri=R(x(i)) ;
    y(:,i+1)=(h^2)*inv(M)*(Ri-K*Ui)+Ui-U_ant ;
    U_ant=y(:,i) ;
  end
  figure(1)
  plot(x,y(1,:))
  figure(2)
  plot(x,y(2,:))
end

function Rx=R(x)
  Rx(1,1)=5*x ;
  Rx(2,1)=-3*x^2 ;
end
