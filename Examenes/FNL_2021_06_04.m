function Final
  clc; clear
  disp('f Funcion por Runge K')
  h=0.02; x=0:h:6 ;
  y=Runge_k(x,h) ;
  z=y(1,:) ;
  disp('Derivada Pimera de w')
  dz=Derivada_Primra(z,h) ;
  figure(1)
  plot(x,dz)
  disp('Figura de dz en funcion de z')
  figure(2)
  plot(z,dz,'o')
  disp('La integral de 1 a 4')
  a=1/h+1;  b=4/h+1;
  v=z(a:b);  t=x(a:b);
  v=(5+v').*t'.^2 ;
  I=Trapecios_Multiples(v,h)

end
function y=Runge_k(x,h)
  n=length(x) ;
  A=D=5; B=2; C=12; w=0.5;
  K=[0 1;-C/A -B/A]
  C=@(t) t*sin(3*t)*[0;D/A] ;
  y0=[A;B]
  y=zeros(2,n) ;
  y(:,1)=y0 ;
  for i=1:n-1
    yk=y(:,i) ;
    c=feval(C,x(i)) ;
    k1=h*(K*yk+c) ;
    tg=x(i)+h/(2*w) ;
    yg=yk  +k1/(2*w) ;
    c=feval(C,tg) ;
    k2=h*(K*yg+c) ;
    y(:,i+1)=yk+(1-w)*k1+w*k2 ;
  end
end
function dy=Derivada_Primra(y,h)
  n=length(y) ;
  dy=zeros(1,n) ;
  dy(1)=-3*y(1)+4*y(2)-y(3) ;
  dy(n)=3*y(n)-4*y(n-1)+y(n-2) ;
  for i=2:n-1
    dy(i)=y(i+1)-y(i-1) ;
  end
  dy=dy/2*h ;
end
function I=Trapecios_Multiples(y,h)
  n=length(y) ;
  I=1/3*(y(1)+y(n)) ;
  for i=2:n-1
    if mod(i,2)==0
      I=I+4/3*y(i) ;
    else
      I=I+2/3*y(i) ;
    end
  end
  I=I*h ;
end
