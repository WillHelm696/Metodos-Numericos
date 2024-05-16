%Integracion Numerica Metodo de Simpson Compuesto
function Simpson
  clc
  clear
  h=0.4;
  x=0:h:2
  y=[0 0.22 -2.05 -0.61 -0.80 -1]
  S=Integral(h,y,length(x))
end
function S=Integral(dx,y,n)
  I=ones(1,n) ;
  I(1)=I(end)=1/3 ;
  for i=2:2:n-1
    I(i)=4/3 ;
  end
  for i=3:2:n-1
    I(i)=2/3 ;
  end
  S=0;
  I
  for i=1:n
    S=S+I(i)*y(i)*dx ;
  end
end
