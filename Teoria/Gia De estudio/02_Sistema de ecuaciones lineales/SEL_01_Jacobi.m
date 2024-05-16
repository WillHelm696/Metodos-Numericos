function jacobi_00
  clc
  clear
  D=[-2 0; 0 4];
  B=[0 1;3 0];
  b=[2 ;-1];
  disp('Tolerancia')
  Tol=input('');
  disp('Valores Iniciales')
  x=[0;0]
  #PANEL DE CONTROL
  it=0;
  T=-inv(D)*B;
  c=inv(D)*b;
  Err=max((B+D)*x-b);
  while abs(Err)>Tol
    it=it+1;
    s=T*x+c;
    Err=max(s-x);
    x=s;
    if it==1000
      break
    end
  end
  disp('Iteraciones');disp(it)
  disp('Resultado');disp(x)
  disp('Residuo');disp((B+D)*x-b)
end
