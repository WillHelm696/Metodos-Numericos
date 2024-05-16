function  PotenciaEsc_00
  clc
  clear
  %BLOQUE DE DATOS
  disp('Tolerancia')
  Tol=input('');
  disp('Valores')
  x=[1;1;1]
  disp('Matriz')
  A=[4 -1 1;-1 3 -2;1 -2 3];
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
  disp('Iteracione:');disp(it);
  disp('Vector:');disp(x);
  disp('Autovalor:');disp(o);
  disp('Residuo:');disp(Rs);

end
