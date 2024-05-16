% Interpolacion Metodo Directo
function Directo
  I=0:0.01:10;
  x=[3;7;9];
  y=[5;-1;2];
  for i=1:length(I)
    D(i)=fcd(I(i),x,y);
  end
  plot (I,D)
  hold on
  plot(x,y,'o')
  hold off
endfunction

function y=fcd(x,dx,dy)
  M=zeros(length(dx));
  for i=1:length(dx)
    M(:,i)=dx.^(i-1);
  end
  a=inv(M)*dy;
  y=0;
  for i=1:length(dx)
    y=y+a(i)*x^(i-1);
  end
endfunction
