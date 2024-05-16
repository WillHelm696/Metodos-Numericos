function Gauss
  clc;
  Tol=0.001
  A=[-3 1 -2; 4 -5 0; 1 -3 6];
  b=[-3 ;1 ;-2];
  D=Diagonal(A)
  B=A-D;
  T=-inv(D)*B
  c=inv(D)*b
  x=Sel(T,c,Tol)
end

function x=Sel(T,c,Tol)
  m=rows(T);
  x=zeros(m,1);
  xk=zeros(m,1);
  Err=1000;
  while Err>Tol
    for i=1:m
      #Triangular Inferior
      S1=0;
      for j=1:i-1
        S1 = S1 + T(i,j)*x(j);
      end
      #Triangular superior
      S2=0;
      for j=i+1:m
        S2 = S2 + T(i,j)*xk(j);
      end
      x(i)=S1+S2+c(i);
      r(i)=(x(i)-xk(i));
    end
    Err=max(r);
    xk=x;
  end
end

function D = Diagonal(A)
  i=rows(A);
  D=zeros(i,i);
  for n=1:i
    D(n,n)=A(n,n) ;
  end
end

