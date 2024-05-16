function Gauss_01
  clc
  clear
  disp('Tolerancia')
  Tol=input('');
  disp('Valores')
  x=[0;0;0]
  %BLOQUE DE DATOS
  D=[-3 0 0;0 -5 0;0 0 6];
  B=[0 1 -2;4 0 0;1 -3 0];
  b=[2;5;6];
  T=-inv(D)*B;
  Ts=Parte(T,0);
  Ti=Parte(T,1);
  c=inv(D)*b;
  %BLOQUE DE ITERACIONES
  it=0;
  Err=max((B+D)*x-b);
  s=Ts*x+c;
  while abs(Err)>Tol
    it=it+1;
    s=x;
    x=Ti*s+Ts*x+c;
    Err=max(s-x);
    if it==1000
      break
    end
  end
  disp('Iteracione:');disp(it);
  disp('Resultado:');disp(x);
  disp('Residuo:');disp((D+B)*x-b);
end

function T=Parte(A,Int)
  n=length(A);
  T=zeros(n,n);
  for i=1:n
    for j=1:n
      if i<j && (Int == 0)
        T(i,j) = A(i,j);
      elseif i>j && (Int == 1)
        T(i,j) = A(i,j);
      end
    end
  end
end
