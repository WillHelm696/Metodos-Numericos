function jacobi_00
  clc
  clear
  A=[-2 1; 3 4];
  b=[2 ;-1];
  %BLOQUE DE INICIALIZACION
  disp('Tolerancia')
  Tol=input('');
  disp('Valores Iniciales')
  x=[0;0]
  it=0;
  n=rows(b);
  Err=1000;
  #BLOQUE ITERATIVO
  while abs(Err) > Tol
    it=it+1;
    s=zeros(n,1);
    for i=1:n
      s(i)= s(i) + b(i);
      for j=1:n
        if i ~= j
          s(i) = s(i) - A(i,j)*x(j);
        end
      end
      s(i)= s(i)/A(i,i);
    end
    Err=max(s-x) ;
    x=s ;
    if it==1000
      break
    end
  end
  disp('Iteraciones:');disp(it)
  disp('Resultado:'),disp(x)
  disp('Residuo:');disp(A*x-b);
end
