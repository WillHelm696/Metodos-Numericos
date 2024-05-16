function Edo_00
  clc
  clear
  M=[-10 4;-4 0]
  y0=[5;3]
  x0=0 ;h=0.01 ;w=0.5 ;
  x=0:h:1 ;
  n=length(x) ;
  y=zeros(2,n) ;
  y(:,1)= y0;
  for i=1:n-1
    k1=h*M*y(:,i) ;
    tg=x(i)+h/2*w ;
    yg=y(:,i)+k1/2*w ;
    k2=h*M*y(:,i) ;
    y(:,i+1)=y(:,i)+(1-w)*k1+w*k2 ;
  end
  figure(1)
  plot(x,y)
  figure(2)
  f=@(x) 1/3*[1;2]*exp(-2*x)+14/3*[1;1/2]*exp(-8*x) ;
  plot(x,feval(f,x))
end
