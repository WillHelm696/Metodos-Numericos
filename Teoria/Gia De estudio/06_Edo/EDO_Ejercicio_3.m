function Euler_00
  clc;
  clear
  w=1/2
  m=@(t,y) t/2-y/2
  h=0.01; y0=4; x0=0
  x=x0:h:10;
  n=length(x);
  y=zeros(n,1);
  y(1)=y0 ;
  for i=1:n-1
    k1=h*feval(m,x(i),y(i));
    yg=y(i)+k1/2*w ;
    tg=x(i)+h/2*w ;
    k2=h*feval(m,tg,yg) ;
    y(i+1)=y(i) + (1-w)*k1 + w*k2 ;
  end
  plot(x,y)
end
