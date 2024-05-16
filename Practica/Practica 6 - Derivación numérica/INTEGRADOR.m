% Ejercicio Integrador 
function Integrador
  dx=0.5
  x=0:dx:3
  u=[167 176 201 241 291 347 400]
  du=Derivada(dx,u)
  y=2*pi*x
  I=Integral(dx,y,du)
endfunction

function f1=Derivada(h,y)
  n=length(y);
  f1=zeros(1,n);
  f1(1)=-3*y(1)+4*y(2)-1*y(3);
  f1(n)=3*y(n)-4*y(n-1)+1*y(n-2);
  for n=2:n-1
    f1(n)=y(n+1)-y(n-1);
  endfor
  f1=1/(2*h)*f1;
end 

function s=Integral(dx,y,du)
  n=length(y);
  I=ones(1,n);
  I(1)=I(n)=0.5;
  s=0;
  for i=1:n
    s=s+I(i)*y(i)*(du(i)^2)
  end
  s=dx*s
end