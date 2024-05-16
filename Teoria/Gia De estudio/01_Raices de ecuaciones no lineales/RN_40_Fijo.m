#ln(x^2) = 0,7 ; x=0.6
function Fijo
  clc
  clear
  f=@(x) log(x^2)-0.7 ;
  g=@(x) x-(log(x^2)-0.7) ;
  disp('Valor Inicial')
  x=input('');
  disp('Tolerancia Permitido')
  er=input('');
  it=0 ;
  while abs(f(x)) > er
    it=it+1 ;
    r=g(x) ;
    y=f(r) ;
    x=r ;
    if it==1000
      break
    end
  end
  disp('El Nøiretaciones es'); disp(it)
  disp('El valor aproximado'); disp(x)
end
