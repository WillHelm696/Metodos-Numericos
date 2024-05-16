%finalderivadasparciales
clc;
close;
clear;
delta_x=0.25;
kk=-12/((delta_x)^2);
M=kk*[-2 1 0;
   1 -2 1;
   0 1 -2];
K=[0.25^2 0 0;
   0 0.5^2 0;
   0 0 0.75^2];
delta_t=0.001;
t=0:delta_t:1;
nt=length(t);
x=0:delta_x:1;
nx=length(x);
U=zeros(3,nt);

%DIFERENCIA CENTRAL

%calculo del uanterior
g=-inv(K)*M;
uanterior=[((2)^(1/2))/2; 1;((2)^(1/2))/2 ]-delta_t*[3;3;3]+(1/2)*(delta_t)^2*g*[0; 0; 0];
%calculo usiguiente
b=-((delta_t)^2)*(inv(K)*M);
x=[((2)^(1/2))/2; 1;((2)^(1/2))/2];
U(:,1)=x;
for i=1:(nt-1);
  if i>1
    uanterior=U(:,i-1);
  endif
U(:,i+1)=b*U(:,i)+2*U(:,i)-uanterior;
end
%grafica
plot(t,U(2,:),"--m");
title("U(0.5,t) en funcion de t de [0,1]");

%RUNGE KUTTA
y11=[((2)^(1/2))/2; 1;((2)^(1/2))/2];
y22=[3;3;3];
y1=zeros(3,nt);
y2=zeros(3,nt);
w=1/2;
y1(:,1)=y11;
y2(:,1)=y22;

for i=1:nt-1
  k11=delta_t*(y2(:,i));
  k12=delta_t*(-inv(K)*M*y1(:,i));
  tg=t(i)+(delta_t/(2*w));
  yg1(:,i)=y1(:,i)+(1/(2*w))*k11;
  yg2(:,i)=y2(:,i)+(1/(2*w))*k12;
  k21=delta_t*yg2(:,i)
  k22=delta_t*(-inv(K)*M*yg1(:,i));
  y1(:,i+1)=y1(:,i)+(1-w)*k11+w*k21;
  y2(:,i+1)=y2(:,i)+(1-w)*k12+w*k22;
 
end
%grafica
figure(2)
plot(t,y1(2,:),"-.k");















