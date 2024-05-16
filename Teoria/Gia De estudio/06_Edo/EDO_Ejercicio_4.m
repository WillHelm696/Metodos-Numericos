function Runge_00
  clc
  clear
  m=@(x,y) 2*y-2*x-1
  x0=0; y0=2 ;h=0.1; w=1/2 ;
  x=0:h:1 ;
  n=length(x) ;
  y=zeros(1,n) ;
  y(1)=y0 ;
  for i=1:n-1
    k1=h*feval(m,x(i),y(i));
    tg=x(i)+h/2*w ;
    yg=y(i)+k1/2*w ;
    k2=h*feval(m,tg,yg) ;
    y(i+1)=y(i)+(1-w)*k1+w*k2 ;
  end
  plot(x,y)
end
