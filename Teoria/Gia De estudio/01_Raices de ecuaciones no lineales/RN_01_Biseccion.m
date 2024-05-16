#x-2^(-x) en [0,1]
function biseccion_01
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
  if fc(a) * fc(b) < 0
    r=(a+b)/2;
    yr=fc(r);
    while (abs(yr)>er)
      it = it + 1;% Se hace una iteraci¢n
      r = (a+b)/2; % Se aplica la FORMULA DE RECURRENCIA
      yr=fc(r);
      if (fc(a) * fc(r) > 0) %Bloque ACTUALIZACI‡N DE VARIABLES
        a = r; % Hace uso de la funci¢n fc(x)
      else
        b = r;
      end
      if ((it == 1000))
        break
      end
    end
  end
  disp('el resultado es r: '); disp(r);
  disp('numero de iteraciones:'); disp(it);
end
  % FUNCION
function fx = fc(x)
  fx=x-2^(-x);
end
