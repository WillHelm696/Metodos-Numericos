%EDP Discretitacio a SEL 2ø Orden
%Metodo de Diferencia Central
function D_Central
  clc
  clear
  h=0.001 ; t=0:h:2 ;
  K=(12/0.25^2)*[2 -1 0 ; -1 2 -1; 0 -1 2]
  M=[(0.25)^2 0 0 ; 0 (0.50)^2 0; 0 0 (0.75)^2]
  U0=[sin(pi*0.25);sin(pi*0.50);sin(pi*0.75)]
  dU0=[3;3;3]
        #Calculo
  d2U0=-inv(M)*K*U0 ;
  Uant=U0-h*dU0+(h^2/2)*d2U0 ;
  m=rows(U0) ; n=length(t) ;
  U=zeros(m,n); U(:,1)=U0 ;
  C=inv(M)*(2*M-(h^2)*K)
  for i=1:n-1
    U(:,i+1)=C*U(:,i)-Uant ;
    Uant=U(:,i) ;
  endfor
        #Grafica
  plot(t,U);
end
