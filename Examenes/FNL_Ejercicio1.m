function FNL_00
  clc
  clear
  %BLOQUE DE DATOS
  h=0.01 ;
  x=0:h:1 ;
  M=(12/0.2^2)*[2 -1 0 0;-1 2 -1 0;0 -1 2 -1;0 0 -1 2]
  K=[0.2^2 0 0 0;0 0.4^2 0 0;0 0 0.6^2 0;0 0 0 0.8^2]
  %BLOQUE DE ITERACIONES
  n=length(x) ;
  y=zeros(4,n) ;
  U0=[sin(pi*0.2);sin(pi*0.4);sin(pi*0.6);sin(pi*0.8)] ;
  dU0=[3;3;3;3]
  d2U0=-inv(K)*(M*U0)
  U_ant=U0-h*dU0+(h^2/2)*d2U0
  y(:,1)=U0 ;
  for i=1:n-1
    Ui=y(:,i)
    y(:,i+1)= inv(K)*(-M*Ui) + Ui - U_ant ;
    U_ant=y(:,i) ;
  end
  plot(x,y(1,:))
  %figure(2)
  %plot(x,y(2,:))
  %figure(3)
  %plot(x,y(3,:))
  %figure(4)
  %plot(x,y(4,:))
end

function Deriv_1(x,y,h)

end
