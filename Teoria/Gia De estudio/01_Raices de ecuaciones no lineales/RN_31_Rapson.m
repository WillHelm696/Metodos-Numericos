# x^2+6*x-27 , x=89 , er=1.e-6
function rapson_01
  clc
  clear
  f=@(x) x^2+6*x-27;
  df=@(x) 2*x+6;
  %BLOQUE DE INICIALIZACION
  disp('Ingrese el primer numero:');
  x = input('');
  disp('Ingrese el error tolerado:');
  er = input('');
  it=0
  while f(x)>er
    it=it+1;
    r=x-f(x)/df(x);
    x=r;
    if it==1000
      break
    end
  end
  disp('el resultado es r: '); disp(r);
  disp('numero de iteraciones:'); disp(it);0
end
