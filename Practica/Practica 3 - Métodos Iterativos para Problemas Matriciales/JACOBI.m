#Metodo de JACOBI
function Jacobi
  clc;
  A=[-3 1 -2;4 -5 0;1 -3 6]
  b=[-2; 5; 6]
  Tol=0.01
  x=Sel(A,b,Tol);
end

function x=Sel(A,b,Tol)
  m=rows(A);
  xk=zeros(m,1);
   Err=1000;
  while Err>Tol
    for i=1:m
      Num=0;
      for j=1:m
        if i~=j
          Num = Num + A(i,j)*xk(j);
        end
      endfor
      x(i)=(b(i)-Num)/A(i,i);
      r(i)=abs(x(i)-xk(i));
    endfor
    Err=max(r)
    xk=x
  end
end
