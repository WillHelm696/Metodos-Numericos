function Edo_00
  clc
  clear
  M=[-8 6;-2 9]
  y0=[12;22]
  x0=0 ;h=0.01 ;w=1 ;
  x=0:h:2 ;
  n=length(x) ;
  y=zeros(2,n) ;
  y(:,1)= y0;
  for i=1:n-1
    k1=h*M*y(:,i) ;
    tg=x(i)+h/2*w ;
    yg=y(:,i)+k1/2*w ;
    k2=h*M*yg ;
    y(:,i+1)=y(:,i)+(1-w)*k1+w*k2 ;
  end
  plot(x,y)
end
