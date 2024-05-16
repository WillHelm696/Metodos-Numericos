function Lagrange_01
  clc
  clear
  %BLOQUE DE DATOS
  disp('Valores de X')
  x=[1.5 3 4.5];
  disp('Valores de Y')
  y=[3 4 3.5];
  %BLOQUE DE OPERACION
  n=length(x);
  L=zeros(n,n);
  for i=1:n
    v=1;
    for j=1:n
      if i~=j
        v = conv(v,poly(x(j)))/(x(i)-x(j));
      end
    end
    L(i,:) = v
  end
  f=y*L
  D=0:0.1:5 ;
  I=polyval(f,D) ;
  plot(D,I)
  hold on
  plot(x,y,'o')
  hold off
end
