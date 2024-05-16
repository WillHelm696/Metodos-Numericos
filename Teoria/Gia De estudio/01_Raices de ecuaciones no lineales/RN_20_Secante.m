% Ejercicio-4
function secante_00
  clc
  clear
  %BLOQUE DE INICIALIZACION
  disp('Ingrese el primer numero:');
  a = input('');
  disp('Ingrese el segundo numero:');
  b = input('');
  disp('Ingrese el error tolerado:');
  er = input('');
  it = 0; % contador de iteraciones
  % BLOQUE ITERATIVO
  yr=fc(a);
  while (abs(yr)>er)
    it = it + 1;% Se hace una iteraci¢n
    m=(fc(b)-fc(a))/(b-a);
    r=a-fc(a)/m % Se aplica la FORMULA DE RECURRENCIA
    yr=fc(r);
    b = a;
    a = r;
    if ((it == 1000))
      break
    end
  end
  disp('el resultado es r: '); disp(r);
  disp('numero de iteraciones:'); disp(it);
end
  % FUNCION
function fx = fc(x)
  fx=x^3-27;
end
