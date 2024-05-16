function Contorno_00
  clc
  clear
  h=0.25;
  U=(10/h^2)*[-2 1 0 0;1 -2 1 0;0 1 -2 1;0 0 0 1]
  x(:,1)=0+h:h:1
  Xk=3*[1-x(2);1-x(3);1-x(4);5/3]
  y=inv(U)*Xk
end
