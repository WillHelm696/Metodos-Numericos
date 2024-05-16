# Metodod de minimos Cuadrados
function Minimos
  x=[0 1 2 3]
  y=[4 1 1 20]
  P=phi(x,3) %  Definir de cuanto sera la base del Pn
  S=transpose(P)*P
  I=transpose(P)*transpose(y)
  A=inv(S)*I

  D=0:0.01:10;
  T=polyval(flipud(A),D);
  plot(D,T)
  hold on
  plot(x,y,'o')
  hold off
end

function A=phi(x,n)
  m=length(x);
  A=zeros(m,n);
  for i=1:m
    for j=1:n
      A(i,j)=x(i)^(j-1);
    end
  end
end
