function Runge_K
  clc
  clear
  #BLOQUE DE DATOS
  M =[3 -2 0;-1 3 -2;0 -1 3]
  T=@(t) [13-9*t;-15+7*t;7-6*t]
  y0=[5;3;2]; x0=0 ;h=0.01 ;w=1
  x=x0:h:2 ;
  #BLOQUE DE ITERACIONES
  n=length(x);
  y=zeros(3,n);
  for i=1:n-1
    K=feval(T,x(i)) ;
    k1=h*(K+M*y(:,i)) ;
    tg=x(i)+h/2*w ;
    yg=y(:,i)+k1/2*w ;
    K=feval(T,tg) ;
    k2=h*(K+M*yg) ;
    y(:,i+1)=y(:,i) + (1-w)*k1 + w*k2 ;
  end
  %BLOQUE DE GRAFICA
  f=@(t) 3*x+0.6*2*exp(x)+ 0.2*3*exp(3*x) + 1.6*2*exp(5*x)
  fx=feval(f,x)
  figure(1)
  plot(x,y(1,:))
  figure(2)
  plot(x,fx)
end
