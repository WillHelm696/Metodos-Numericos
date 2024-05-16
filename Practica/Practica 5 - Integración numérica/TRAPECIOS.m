%Integracion Numerica Metodo de Trapecios Compuesto
function Trapecios
  clc
  clear
  h=0.2*2;
  x=0.2:h:1
  y=[46.36 58.9 61.56]
  S=Integral(h,y,length(x))
end

function S=Integral(dx,y,n)
  I=ones(1,n) ;
  I(1)=I(end)=1/2 ;
  S=0;
  for i=1:n
    S=S+I(i)*y(i)*dx ;
  end
end
