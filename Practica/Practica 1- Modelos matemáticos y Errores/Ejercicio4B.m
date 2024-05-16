%Norma CUadratica de un vetor
function Unitario
  V=[5 7 9];
  disp(V)
  lng=length(V);
  Nor=0;
  disp('La Norma Cuadratica del Vector Es')
  for n=1:lng
    Nor=Nor+(V(n))^2;
  end
  Nor=Nor^0.5;
  for n=1:lng
    V(n)=V(n)/Nor;
  end
  disp(Nor)
  disp('Elvector Unitaario es ')
  disp(V)
  end


