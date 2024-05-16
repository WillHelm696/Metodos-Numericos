%EDP Discretitacio a SEL 2ø Orden
%Reducion a 1ø Orden
%Metodo de Runge Kuta
function Discretitacion
  clc
  clear
  h=0.001 ; t=0:h:2 ;
  K=(12/0.25^2)*[2 -1 0 ; -1 2 -1; 0 -1 2]
  M=[(0.25)^2 0 0 ; 0 (0.50)^2 0; 0 0 (0.75)^2]
  U0=[sin(pi*0.25);sin(pi*0.50);sin(pi*0.75)]
  dU0=[3;3;3]

  for i=1:n-1
    k1
  endfor
        #Grafica
  plot(t,U);
end
