#Metodo de EULER (ADELANTE)
function Euler_00
  y0=4; % Valores Iniciales
  t0=0;
  Dt=0.01; % incremento de tiempo
  NDt=1000; % cantidad de Dt a realizar
  % Dimensionamiento
  t=zeros(NDt,1); % vector para tiempo
  y=zeros(NDt,1); % vector para y(t)

  % Inicializaciên
  t(1)=t0;
  y(1)=y0;
  % EULER
  for j=1:NDt-1
    k1=Dt*(-(1/2)*y(j) + (1/2)*t(j));
    y(j+1) = y(j)+k1;
    t(j+1) = t(j)+Dt;
  end
  % Graficaciên
  figure(1)
  plot(t,y(:,1),'b');
end
