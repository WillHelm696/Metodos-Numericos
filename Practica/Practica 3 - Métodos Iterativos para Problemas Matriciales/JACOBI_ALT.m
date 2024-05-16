function Jacobi
  clc;
  Err=0.01 ;
  A=[-3 1 -2; 4 -5 0; 1 -3 6]
  b=[-3 ;1 ;-2]
  D=Diagonal(A) ;
  B=A-D ;
  T=inv(-D)*B ;
  c=inv(-D)*b ;
  x=Sel(T,c,Err)
end

function x=Sel(T,c,Tol)
  x=[0;0;0] ;
  Cnt=0 ;
  Err=1000 ;
  while Err>Tol
    Cnt=Cnt+1 ;
    xn=T*x+c ;
    Err=max(abs(xn-x)) ;
    x=xn
  end
end

function D=Diagonal(A)
  j=columns(A);
  i=rows(A) ;
  D=zeros(i,j) ;
  for n=1:j
    D(n,n)=A(n,n) ;
  end
end
