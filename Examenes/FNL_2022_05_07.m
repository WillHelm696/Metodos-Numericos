function Final
  clc; clear
  #Ejercico 1
  h=1/10; tf=150; td=50;
  x=0:h:tf ;
  y = Derivada_Central(h,x);
  disp('Grafica de z3')
  z3=y(3,:) ;
  plot(x,z3)
  disp('Vector en t=dt')
  xk=td/h+1;
  v = y(:,xk)
end

function y=Derivada_Central(h,x)
  K=[2 -1 0 0 0
    -1 2 -1 0 0
     0 -1 2 -1 0
     0 0 -1 2 -1
     0 0 0 -1 2] ;
  b=50/18*[5;8;9;8;5] ;
  M=5*eye(5) ;
  D=-(h^2)*inv(M)*K+2*eye(5) ;
  C=(h^2)*inv(M)*b ;
  dU0=U0=[0;0;0;0;0] ;
  d2U0=inv(M)*(b*G(0)-K*U0) ;
  U_ant=U0-h*dU0+(h^2/2)*d2U0 ;
  n=length(x) ;
  y=zeros(5,n) ;  y(:,1)=U0 ;
  for i=1:n-1
    Ui=y(:,i) ;
    g=G(x(i)) ;
    y(:,i+1)=C*g+D*Ui-U_ant;
    U_ant=Ui ;
  end
end

function g=G(t)
  if 0<= t <=50
    g=t*(t-50)/-625 ;
  else
    g=0 ;
  end
end
