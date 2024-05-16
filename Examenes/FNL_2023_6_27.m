function Final
  clc
  clear
  disp('A y B :Minimos Cuadrados')
  Ph=Minimos_Cuadrado()
  disp('C(Dt): convergencia global')
  Ddt=1/Ph(1)
  #Un valor que tiende cercanamente a cero
  Dte=0.25/2 ;
  t=0:Dte:50 ;
  #Vector Funcion
  Z=Diferencia_Central(Dte,t) ;
  z3=Z(3,:) ;
  #Vector derivada
  V=Derivada(Z,Dte);
  v3=V(3,:);
  disp('Intervalo donde existe una Raiz con v positivo')
  I=Raizes_Cresientes(z3,v3);
  tk=t(I(1))
  tk1=t(I(2))
  disp('Vectores en ambos extremos del intervalo')
  Zk=Z(:,I(1))
  Zk1=Z(:,I(2))
  Vk=V(:,I(1))
  Vk1=V(:,I(2))
  #Grafica de z3 y z
  hold on
  plot(t,z3,'r')
  plot(t,v3,'b')
  hold off
end
function Ph=Minimos_Cuadrado()
  Dt=[1;0.5;0.25] ;
  CDt=[29.989;29.974;29.969] ;
  PHI=[Dt.^0 Dt.^2] ;
  M=transpose(PHI)*PHI ;
  b=transpose(PHI)*CDt ;
  Ph=M\b;
end
function Z=Diferencia_Central(h,x)
  K=[2 -1 0 0 0
   -1 2 -1 0 0
    0 -1 2 -1 0
    0 0 -1 2 -1
    0 0 0 -1 2];
  M=5*eye(5);
  T=-inv(M)*K;
  n=length(x);
  Z0=zeros(5,1);
  dZ0=[1/2;(3^0.5)/2;1;(3^0.5)/2;1/2];
  d2Z0=T*Z0 ;
  U_ant=Z0-h*dZ0+(h^2/2)*d2Z0;
  Z=zeros(5,n);
  Z(:,1)=Z0;
  for i=1:n-1
    Ui=Z(:,i) ;
    Z(:,i+1)=T*h*Ui+2*Ui-U_ant ;
    U_ant=Ui ;
  end
end
function dy=Derivada(y,h)
  m=rows(y) ;
  n=columns(y) ;
  dy=zeros(m,n) ;
  dy(:,1)=-3*y(:,1)+4*y(:,2)-y(:,3) ;
  for i=2:n-1
    dy(:,i)=y(:,i-1)-2*y(:,i)+y(:,i-1) ;
  end
  dy(:,n)=3*y(:,n)-4*y(:,n-1)+y(:,n-2) ;
  dy=dy/(2*h) ;
end

function I=Raizes_Cresientes(y,v)
  n=length(y) ;
  for i=1:n-1
    if y(i)*y(i+1)<0
      if v(i)>0
        I=[i i+1];
        break
      end
    end
  end
end
