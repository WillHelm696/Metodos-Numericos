function Minimos_01
  clc
  clear
  %BLOQUE DE DATOS
  disp('Orden del polinomio')
  n=input('');
  disp('Valores de X')
  x=[1.5; 3; 4.5]
  disp('Valores de Y')
  y=[3; 4; 3.5]
  %BLOQUE DE OPERACION
  A=phi(n,x)
  m=transpose(A)*A ;
  b=transpose(A)*y ;
  a=inv(m)*b ;
  plot(x,y)
  D=0:0.1:10 ;
  I=polyval(flipud(a),D);
  plot(x,y,'o')
  hold on
  plot(D,I)
end

function A=phi(n,x)
  for i=0:n-1
    A(:,i+1)=x.^i ;
  end
end
