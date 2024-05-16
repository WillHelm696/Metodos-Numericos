# Runge Kuta
function R_K
  clc
  clear
  h=0.01;
  t=0:h:30;
  w=1;
  K=[0 1;(-400/65) 0]
  n=length(t) ;
  m=rows(K);
  y=zeros(m,n);
  for i=1:n-1
    ym=y(:,i);
    b=fun_b(t(i));
    k1=h*(K*ym+b);
    yg=ym+k1/(2*w);
    xg=t(i)+h/(2*w);
    bg=fun_b(xg);
    k2=h*(K*yg+bg);
    y(:,i+1)=ym+(1-w)*k1+w*k2;
  end
  figure(1)
  plot(t,y)
  figure(2)
  plot(y(1,:),y(2,:))
end

function b = fun_b(t)
  b=[0;1]*((800/65)*sin(5*t));
end
