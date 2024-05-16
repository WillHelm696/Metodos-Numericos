function Runje_K_02
  clc
  clear
  w=1; k=400; m=65; omg=5 ;
  K=@(x) (1/m)*sin(omg*x)*[0;1]
  h=0.01 ;
  y0=[0;0];
  x=0:h:20 ;
  M=[0 1;-k/m 0] ;
  n=length(x) ;
  y=zeros(2,n) ;
  y(:,1)=y0 ;
  for i=1:n-1
    C=feval(K,x(i));
    k1=h*(M*y(:,i)+C) ;
    yg=y(:,i)+k1/2*w ;
    tg=x(i)+h/h*w ;
    C=feval(K,tg);
    k2=h*(M*yg+C);
    y(:,i+1)=y(:,i)+(1-w)*k1+w*k2 ;
  end
  ws=(k/m)^0.5 ;p=80 ;
  f=@(t) (p*sin(omg*t))/(k*(1-(omg/ws)^2)) - (omg*sin(ws*t))/ws ;
  fx=feval(f,x) ;
  figure(1)
  plot(x,y)
  figure(2)
  plot(x,fx)
end
