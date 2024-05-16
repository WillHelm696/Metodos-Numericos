function RK_Sistema
  clc
  clear
  w=0.5;
  h=0.01;
  t=0:h:1;
  K=(12/h^2)*[2 -1 0; -1 2 -1; 0 -1 2]
  M=[0.25^2 0 0 ; 0 0.5^2 0; 0 0 0.75^2]
  U0=[sin(pi*0.25);sin(pi*0.5);sin(pi*0.75)]
  dU0=[3;3;3]
  O=zeros(3,3)
  I=eye(3)
  A=[O I;-inv(M)*K O]
  y0=[U0;dU0]
  n=length(t);
  m=rows(y0);
  y=zeros(m,n);
  y(:,1)=y0;
  for i=1:n-1
    ym=y(:,i);
    k1=h*A*ym;
    yg=ym+k1/2*w;
    #xg=t(i)+h/2*w
    k2=h*A*yg;
    y(:,i+1)=ym+(1-w)*k1+w*k2;
  end
  plot(t,y(1,:),'r');
  hold on
  plot(t,y(2,:),'b');
  plot(t,y(3,:),'g');
  hold off
end
