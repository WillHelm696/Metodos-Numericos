#Metodo del polinomio de newton
function Newton
  x=[3; 7; 9; 2];
  y=[5; -1; 2; 2];
  A=Coeficiente(x,y)
  D=0:0.1:10 ;
  I=Imagen(x,diag(A),D);
  plot(D,I)
  hold on
  plot(x,y,'o')
  hold off
end

function M=Coeficiente(X,Y)
  n=length(X);
  M=zeros(n,n);
  M(:,1)=Y;
  for i=2:n
    for j=i:n
      M(j,i)=((M(j,i-1)-M(j-1,i-1)))/(X(j,1)-X(j-i+1,1));
    end
  end
end

function I=Imagen(X,A,x)
  n=length(X);
  I=0;
  for i= n:-1:1
    v=1;
    for j= i-1:-1:1
      v=conv(v,poly(X(j)));
    end
    I=I+polyval(v,x)*A(i);
  end
end

