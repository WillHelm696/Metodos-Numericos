# Interpolacion Metodo Directo
function Directo
  clc
  clear
  x=[0.4;1.6;2.4];
  y=[0.3894;0.9996;0.6755];
  P=phi(x)
  An=inv(P)*y
  D=0:0.01:10;
  I=polyval(flipud(An),D);
  plot(D,I)
  hold on
  plot(x,y,'o')
  hold off
end

function A=phi(x)
  n=length(x);
  A=zeros(n,n);
  for i=1:n
    A(:,i)=x.^(i-1);
  end
end

