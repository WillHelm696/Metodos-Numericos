function PotenciaInv_01
  clc
  clear
  disp('Tolerancia')
  Tol=input('');
  disp('Valores')
  x=[1;1;1]
  disp('Matriz')
  B=[2 -1 0;-1 4 -1;0 -1 2];
  A=inv(B)
  %BLOQUE DE ITERACION
  it=0;
  Err=Tol+1;
  while Err>Tol
    it=it+1;
    k=max(abs(x));
    v=x/k;
    x=A*v;
    o=min(x./v) ;
    Rs=A*v-o*v ;
    Err=max(abs((Rs)));
    if it==1000
      break
    end
  end
  disp('Iteraciones:');disp(it);
  disp('Autovector:');disp(x);
  disp('Autovalor:');disp(o);
  disp('Residuo:');disp(Rs);

end
