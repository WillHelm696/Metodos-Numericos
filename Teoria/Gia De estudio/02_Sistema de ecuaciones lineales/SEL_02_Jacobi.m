function jacobi_00
  clc
  clear
  D=[-3 0 0;0 -5 0;0 0 6];
  B=[0 1 -2;4 0 0;1 -3 0];
  b=[2;5;6];
  %BLOQUE DE DATOS
  disp('Tolerancia')
  Tol=input('');
  disp('Valoes Iniciale')
  x=[0;0;0]
  %BLOQUE DE ITERACIONES
  it=0
  T=-inv(D)*B;
  c=inv(D)*b;
  Err=(B+D)*x-b;
  while abs(Err)>Tol
    it=it+1;
    s=T*x+c;
    Err=s-x;
    x=s;
    if it ==1000
      break
    end
  end
  disp('Iteracione');disp(it)
  disp('Resultado');disp(x)
  disp('Residuo');disp((D+B)*x-b)
end
