%Registro de temperatura Cada 6hs
function Temperatura
  disp('Registre las temeperaturas Cada 6sh')
  for i=1:4
    Temp(i)=input('Temperatura :');
  endfor
  disp('Mayor y menor Temperatura registrada')
  Men=Temp(1);
  May=Temp(1);
  for n=1:4
    if Men>Temp(n);
      Men=Temp(n);
    else May<Temp(n);
      May=Temp(n);
    endif
  endfor
  disp(Men)
  disp(May)
end

