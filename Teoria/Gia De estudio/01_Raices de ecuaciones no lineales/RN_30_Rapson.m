# x^2-4 = 0 ; r=1.3
function Newton_01
  clc
  clear
  f=@(x) x^2-4 ;
  df=@(x) 2*x ;
  %BLOQUE DE INICIALIZACION
  disp('Ingrese el primer numero:');
  x = input('');
  disp('Ingrese el error tolerado:');
  er = input('');
  it=0
  % BLOQUE ITERATIVO
  while abs(f(x)) > er
    it=it+1;
    r=x-f(x)/df(x)
    x=r;
    if it==1000
      break
    end
  end
  disp('el resultado es r: '); disp(r);
  disp('numero de iteraciones:'); disp(it);
end
