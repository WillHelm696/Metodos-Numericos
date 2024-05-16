%Derivacion Numerica 1
function Derivacion
  clc
  clear
  h=0.4;
  x=0:h:2
  y=[0 0.22 -2.05 -0.61 -0.80 -1]
  f1=Derivada(h,y)
  plot(x,y);
  hold on
  plot(x,f1);
  hold off
end

function f1=Derivada(h,y)
  n=length(y);
  f1=zeros(1,n);
  f1(1)=-3*y(1)+4*y(2)  -1*y(3);
  f1(n)= 3*y(n)-4*y(n-1)+1*y(n-2);
  for n=2:n-1
    f1(n)=y(n+1)-y(n-1);
  endfor
  f1=1/(2*h)*f1;
end
