function Potencia_00
  clc
  clear
  %BLOQUE DE DATOS
  disp('Matriz')
  A=[-10 4;-4 0]
  disp('Tolerancia')
  Tol=input('');
  disp('Valores')
  x=[2;2]
  %BLOQUE DE ITERACIONE
  it=0;
  Err=Tol+1;
  while Err>Tol
    it=it+1 ;
    v=A*x ;
    o=min(v./x) ;
    Rs=A*v-o*v ;
    Err = max(abs(Rs)) ;
    x=v ;
    if it==1000
      break
    end
  end
  disp('Iteracione:');disp(it);
  disp('Vector:');disp(x);
  disp('Autovalor:');disp(o);
  disp('Residuo:');disp(Rs);
end
