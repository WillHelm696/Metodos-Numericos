%Final Ferrari Gaibazzi Juan A.%
clc;
clear;
x0=0;
L=60;
puntosx=7;
dx=(L-x0)/(puntosx-1);
vx=x0:dx:L;
T=100;
m=1;
p=10;
t0=0;
tf=50;
td=10;
dt=1/10;
vt=t0:dt:tf;
puntost=length(vt);

%% Interpolación por Metodo Directo

D=[1 0 0; 1 L/2 (L/2)^2; 1 L L^2];
c=[0; 0.5; 0];
a=D\c;
disp('La función f(x) es:')
disp('f(x)=(2/L)*x-(2/(L^2))*x^2')
% f(x)=a(1)+a(2)*x+a(3)*x^2
vf=a(2)*vx+a(3)*vx.^2;
f=vf(1,2:end-1);
figure(1)
plot(vx,vf)
xlabel('Abscisas')
ylabel('Ordenadas')
title('Grafico de la función f(x)')
grid on

%% Resolución de EDO con Diferencia Central

K=(-T/(dx^2))*[-2 1 0 0 0; 1 -2 1 0 0; 0 1 -2 1 0; 0 0 1 -2 1; 0 0 0 1 -2];
M=m*eye(5);
A=M/(dt^2);

b0=zeros(5,1);
Ua=zeros(5,1);
UaPrima=zeros(5,1);

Uv=Ua-dt*UaPrima+((dt^2)/2)*(inv(M)*(b0-K*Ua));

for i=1:puntost
    if vt(i)<td
        g=vt(i)/td;
    else
        g=1;
    end
    vg(i)=g;
    
    b=p*g*[f(1); f(2); f(3); f(4); f(5)];
    Mb(:,i)=b;
    
    Un=(inv(A)*(b+(2*A-K)*Ua))-Uv;
    
    MUa(:,i)=Ua;
    MUv(:,i)=Uv;
    MUn(:,i)=Un;
    
    Uv=Ua;
    Ua=Un;
    
    
end
figure(2)
plot(vt,vg,'r')
xlabel('Tiempo')
ylabel('Valor de g(t)')
title('Grafico de la función g(t)')
grid on
figure(3)
plot(vt,MUa(3,:))
xlabel('Tiempo')
ylabel('Valor de U(L/2,t)')
title('Grafico de U(L/2,t)')
grid on
U=zeros(7,1);
U(2:6,1)=MUa(:,end);
disp('U(x,tf) entre x0=0 y x=L es:')
disp(U)

%% Derivada

W=zeros(7);
for j=2:6;
    W(j,j+1)=1;
    W(j,j-1)=-1;
end
W(1,1)=-3;
W(1,2)=4;
W(1,3)=-1;
W(end,end-2)=1;
W(end,end-1)=-4;
W(end,end)=3;
dU=(1/(2*dx))*W*U;
disp('dU(x,tf)/dx entre x0=0 y x=L es:')
disp(dU)

%% Integral

H=ones(1,length(U));
H(1,1)=1/2;
H(1,end)=1/2;
dUcuad=dU.^2;
Int=dx*H*dUcuad;
disp('El valor de la integral desde x0=0 a x=L calculada en tf es:')
disp(Int)



















