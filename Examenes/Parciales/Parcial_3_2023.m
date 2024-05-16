function par3
  clc
  clear
  h=1/10 ;
  t=0:h:150;
  M=[4 0 0 0; 0 4 0 0; 0 0 4 0;0 0 0 4]
  K=[2 -1 0 0 ; -1 2 -1 0; 0 -1 2 -1; 0 0 -1 2]
  b=[10;5;5;5]
  g=gt(t(1));
  y0=[0;0;0;0]
  dy0=[0;0;0;0]
  
  d2y0=inv(M)*(b*g-K*y0)
  yant=y0-h*dy0+(h^2/2)*d2y0

  n=length(t);
  m=rows(y0);
  y=zeros(m,n);
  y(:,1)=y0;

  for i=1:n-1
    g=gt(t(i));
    ym=y(:,i);
    y(:,i+1)= inv(M)*(h^2)*(b*g-K*ym) + 2*ym - yant;
    yant=y(:,i);
  endfor
  #punt0 A
  figure 1
  plot(t,y(3,:),'r',t,y(4,:),'b')
  #punto B
  disp('en t=50 y es')
  disp(y(4,50))
  #punto C
  v3=Derivada(t,y(3,:),h) ;
  figure 2
  plot(t,v3);
  #punto D
  I=Integral(t,v3,h)
end

function g=gt(t)
  if t<=50
    g=(-1/50)*t+1 ;
  elseif t>50
    g=0 ;
  endif
end 
#Derivada
function df=Derivada(x,y,h)
  n=length(y);
  df=zeros(1,n);
  df(1)=-3*y(1)+4*y(2)-1*y(3);
  df(n)=3*y(n)-4*y(n-1)+1*y(n-2);
  for n=2:n-1
    df(n)=y(n+1)-y(n-1);
  endfor
  df=1/(2*h)*df;
end 
#Integral
function S=Integral(x,y,h)
  n=length(x)
  I=ones(1,n) ;
  I(1)=I(end)=1/2 ;
  S=0
  for i=1:n
    S=S+I(i)*y(i)*h ;
  end
end