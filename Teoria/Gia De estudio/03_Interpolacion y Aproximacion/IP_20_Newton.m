function Newton_00
  clc
  clear
  %BLOQUE DE DATOS
  disp('Valores de X')
  x=[1.5; 3]
  disp('Valores de Y')
  y=[3; 4]
  %BLOQUE DE OPERACION
  A=Coeficiente(x,y)
  D=0:0.1:5 ;
  I=Imagen(x,diag(A),D);
  plot(D,I)
  hold on
  plot(x,y,'o')
  hold off
end

function M=Coeficiente(x,y)
  n=length(x);
  M=zeros(n,n);
  M(:,1)=y ;
  for i=2:n
    for j=i:n
      M(j,i)=((M(j,i-1)-M(j-1,i-1)))/(x(j,1)-y(j-i+1,1));
    end
  end
end

function I=Imagen(x,A,D)
  n=length(x);
  I=0;
  for i= n:-1:1
    v=1;
    for j= i-1:-1:1
      v=conv(v,poly(x(j)));
    end
    I=I+polyval(v,D)*A(i);
  end
end
