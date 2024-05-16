%Derivacion Numerica 2
function Derivacion
  clc
  clear
  h=0.4;
  x=0:h:2
  y=[0 0.22 -2.05 -0.61 -0.80 -1]

  f2=Derivada(y,h)
  plot(x,y);
  hold on
#  plot(x,f2);
  hold off
end

function f2=Derivada(y,h)
  n=length(y);
  f2=zeros(1,n);
  f2(1)= 2*y(1)-5*y(2)  +4*y(3)  -1*y(4)  ;
  f2(n)= 2*y(n)-5*y(n-1)+4*y(n-2)-1*y(n-3);
  for n=2:n-1
    f2(n)=y(n+1)-2*y(n)+y(n-1);
  endfor
  f2=1/(h^2)*f2;
end
