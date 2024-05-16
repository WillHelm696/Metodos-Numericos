% Integral por trapecios simple o compuesto.
% En este programa el usuario ingresa los valores de h y de y manualmente.
% Para hacer trapecios simple, usar N=1 y trabajar sêlo con dos puntos.
clc
clear
N=input('ingrese el n§ de datos con los que va a trabajar: ');
%leer datos
h=input('ingrese el paso h: ');
y=zeros(N,1); % inicializo el vector de ordenadas y
for i=1:N
%CUIDADO: NO SE USA y0 SINO y1 COMO PRIMER ELEMENTO DEL VECTOR Y.
 y(i)=input(['ingrese la ordenada y(',num2str(i),'): ']);
% num2str(i) convierte el valor numÔrico de variable i en un string
% (un string es una cadena de caracteres, no un n?mero)
% "input" admite un vector de strings como argumento
end
% generaciên del vector de coeficientes
c=zeros(N,1);
c(1)=h*1/2;
c(N)=h*1/2;
for i=2:N-1
 c(i)=h*1;
end
% producto escalar
int=0; % inicializo la variable acumulador
for i=1:N
 int=int+c(i)*y(i);
end
disp('El vector de coeficientes es '),disp(c)
disp('El valor de la integral es '), disp(int)

