% Ejercicio-4
# x^2-27 en [1.5,4]
function biseccion_00
  clc
  clear
  %BLOQUE DE INICIALIZACION
  disp('Ingrese el primer numero:');
  a = input('');
  disp('Ingrese el segundo numero:');
  b = input('');
  disp('Ingrese el error tolerado:');
  e = input('');

  it = 0; % contador de iteraciones
  numsol =0; % indicador de soluci¢n obtenida
  % BLOQUE ITERATIVO
  while (numsol == 0)
    it = it + 1; % Se hace una iteraci¢n
    r = (a+b)/2; % Se aplica la FORMULA DE RECURRENCIA

    if ((abs(fc(r)))<e ) % Bloque CONTROL DE DETENCION
      numsol=1; % Hace uso de la funci¢n fc(x)
    end
    if ((it == 1000))
      numsol = 999;
    end

    if (fc(a) * fc(r) > 0) %Bloque ACTUALIZACI‡N DE VARIABLES
      a = r; % Hace uso de la funci¢n fc(x)
    else
      b = r;
    end
  end
  disp('el resultado es r: '); disp(r);
  disp('numero de iteraciones:'); disp(it);
end

function fx = fc(x)
  fx=x^3-27;
end
