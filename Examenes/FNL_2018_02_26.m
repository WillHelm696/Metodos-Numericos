function FNL_2018
  clc; clear
  T=100; h=1/10 ;tf=50;
  t=0:h:tf ;
  K=-T/h^2*[ -2 1 0 0 0
              1 -2 1 0 0
              0 1 -2 1 0
              0 0 1 -2 1
              0 0 0 1 -2]
  M=eye(5)
  b=F(t(1))
  n=length(t) ;

  U0=[0;0;0;0;0]
  dU0=[0;0;0;0;0]
  d2U0=inv(M)*[b-K*U0] ;
  U_ant=U0-h*dU0+(h^2/2)*d2U0  ;

  y=zeros(5,n); y(:,1)=U0;
  for i=1:n-1
    Uk=y(:,i) ;
    b=F(t(i)) ;
    y(:,i+1)= M*(b-K*Uk)+2*Uk-U_ant ;
    U_ant=Uk ;
  end
  y
  z3=y(3,:);
  plot(t,z3)
end
function b=F(t)
  L=60; dx=L/7;
  x=0:dx:L ;
  f=@(x) -2*(x/L)^2+2*x/L ;
  g=G(t) ;
  b=g*100*[f(x(2));f(x(3));f(x(4));f(x(5));f(x(6))];
end
function g=G(t)
  td=10 ;
  if t <= td
    g=t/td ;
  else
    g=1 ;
  end
end

