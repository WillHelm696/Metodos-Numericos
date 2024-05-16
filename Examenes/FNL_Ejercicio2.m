function FNL_01
  clc
  clear
  K=1/20*[-2 1 0 0 0 0;
          1 -2 1 0 0 0;
          0 1 -2 1 0 0;
          0 0 1 -2 1 0;
          0 0 0 1 -2 1;
          0 0 0 0 1 -2]
  U0=[0;0;0;0;0;0]
  h=10; td=750; ft=6*td; w=1/2;
  x=0:h:ft ;
  n=length(x) ;
  y=zeros(6,n) ;
  for i=1:n-1
    g=G(x(i)) ;
    p=g/50*[1;0;0;0;0;0] ;
    k1=h*(K*y(:,i)+p*g) ;
    yg=y(:,i)+k1/2*w ;
    tg=x(i)+w/2*w ;
    g=G(tg) ;
    p=g/50*[1;0;0;0;0;0] ;
    k2=h*(K*yg+p*g) ;
    y(:,i+1)=y(:,i)+(1-w)*k1+w*k2 ;
  end
  plot(x,y(3,:))
end

function g=G(t)
  if t>750
    g=300 ;
  else
    g=(300/750)*t ;
  end
end
