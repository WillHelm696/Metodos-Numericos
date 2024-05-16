#Merodo de Lagrange
function Lagrange
  x=[3 7 9];
  y=[5 -1 2];
  f=Polinomio(x,y)
  D=0:0.1:10 ;
  I=polyval(f,D);
  plot(D,I)
  hold on
  plot(x,y,'o')
  hold off
end

function f=Polinomio(X,Y)
  w=length(X);
  n=w-1;
  L=zeros(w,w);
  for k=1:n+1
    V=1;
    for r=1:n+1
      if k~=r
        V = conv(V,poly(X(r)))/(X(k)-X(r));
      end
    end
    L(k,:) = V
  end
  f=Y*L;
end
