function Runje_K_01
  y0=[pi/4;0]; L=10 ;g=9.81; h=0.1; w=1;
  x=0:h:20 ;
  M=[0 1;-g/L 0]
  n=length(x)
  y=zeros(2,n) ;
  y(:,1)=y0 ;
  for i=1:n-1
    k1=h*M*y(:,i) ;
    yg=y(:,i)+k1/2*w ;
    tg=x(i)+h/h*w ;
    k2=h*M*yg ;
    y(:,i+1)=y(:,i)+(1-w)*k1+w*k2 ;
  end
  plot(x,y(1,:))
end
