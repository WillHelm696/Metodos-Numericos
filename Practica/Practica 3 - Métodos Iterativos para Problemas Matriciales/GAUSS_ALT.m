#Metodo de Gauss Seidel
function Jacobi
  clc;
  Tol=0.01
  A=[-3 1 -2; 4 -5 0; 1 -3 6];
  b=[-3 ;1 ;-2];
  D=Diagonal(A);
  B=A-D;
  T=-inv(D)*B
  c=inv(D)*b
  Ti=Inferior(T);
  Ts=Superior(T);
  x=Sel(Ti,Ts,c,Tol)
end

function x=Sel(Ti,Ts,c,Tol)
  x=[0;0;0];
  Err=1000;
  while Err>Tol
    xk=x
    x= Ti*x+ Ts*xk + c
    Err=max(abs(xk-x));
  end
end

function D = Diagonal(A)
  i=rows(A);
  D=zeros(i,i);
  for n=1:i
    D(n,n)=A(n,n) ;
  end
end

function Ti=Inferior(T)
  n=rows(T);
  Ti=zeros(n,n);
  for i=1:n
    for j=1:i-1
      Ti(i,j)=T(i,j) ;
    end
  end
end

function Ts=Superior(T)
  n=rows(T);
  Ts=zeros(n,n);
  for i=1:n
    for j=i+1:n
      Ts(i,j)=T(i,j) ;
    end
  end
end
