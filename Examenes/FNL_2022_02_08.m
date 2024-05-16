function Final
  clc
  clear
  h=10 ;w=1 ;
  td=750 ;tf=6*td ;x=0:h:tf;
  disp('Grafica de z3')
  y=Runge_k(x,h,w);
  z3=y(3,:);
  #figure(1)
  #plot(x,z3)
  disp('Grafica de dz3')
  v=Derivada_Primera(z3,h);
  #figure(2)
  #plot(x,v)
  disp('Vector z en t=tf/2')
  t=Buscar(x,tf/2) ;
  vz=y(:,t)
  disp('Promedio del vector z en t=tf/2')
  prm=norm(vz)
  disp('Derivada del vector z')


end
function y=Runge_k(x,h,w)
  n=length(x);
  K=1/50*[-2 1 0 0 0 0
          1 -2 1 0 0 0
          0 1 -2 1 0 0
          0 0 1 -2 1 0
          0 0 0 1 -2 1
          0 0 0 0 1 -2];
  p=300/50*[1;0;0;0;0;0] ;
  y0=zeros(6,1) ;
  y=zeros(6,n);
  y(:,1)=y0;
  for i=1:n-1
    gt=G(x(i)) ;
    yk=y(:,i) ;
    k1=h*(K*yk+p*gt) ;
    xg=x(i)+h/2*w ;
    yg=yk+k1/2*w ;
    gt=G(xg) ;
    k2=h*(K*yg+p*gt) ;
    y(:,i+1)=yk+(1-w)*k1+w*k2 ;
  end
end
function g=G(t)
  if t>750
    g=1 ;
  elseif 0<=t<=750
    g=t/750 ;
  end
end
function dy=Derivada_Primera(y,h)
  n=length(y) ;
  dy=zeros(1,n) ;
  dy(1)=-3*y(1)+4*y(2)-y(3) ;
  dy(n)=3*y(n)-4*y(n-1)+y(n-2) ;
  for i=2:n-1
    dy(i)=y(i+1)-y(i-1) ;
  end
  dy=dy/2*h ;
end
function t=Buscar(x,elm)
  n=length(x);
  for i=1:n
    if x(i)==elm
      t=i;
      break
    end
  end
end
