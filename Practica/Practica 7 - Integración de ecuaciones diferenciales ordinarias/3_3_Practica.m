%Diferencia Central Matricial Con Valores Inciciales
function MD_Central
  clc
  clear
  h=1 ;x=0:h:150 ;
  y0=dy0=[0;0;0;0;0]
  K=[ 2 -1 0 0 0;-1 2 -1 0 0;0 -1 2 -1 0;0 0 -1 2 -1;0 0 0 -1 2]
  M=[5 0 0 0 0;0 5 0 0 0;0 0 5 0 0;0 0 0 5 0;0 0 0 0 5]
  b=(50/19)*[5;8;9;8;5]
      #Calculo
  g=g_func(x(1));
  d2y0=inv(M)*(b*g-K*y0);
  y_ant=y0-h*dy0+(h^2/2)*d2y0;
  n=length(x);
  m=rows(y0);
  y=zeros(m,n); y(:,1)=y0;
  for i=1:n-1
    yi=y(:,i);
    g=g_func(x(i));
    y(:,i+1) = inv(M)*(h^2)*(b*g-K*yi)+2*yi-y_ant;
    y_ant=y(:,i);
  end
        #Grafica
  plot(x,y(1,:));
  hold on
  plot(x,y(2,:));
  plot(x,y(3,:));
  hold off
end

function g=g_func(t)
  if 0<=t<(45/2)
    g=(2/45)*t;
  elseif (45/2)<=t<45
    g=(-2/45)*t+2;
  else
    g=0;
  end
end
