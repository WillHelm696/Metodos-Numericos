%Suma de matrices de Orden 2
function Adicion
  A=[6 4 ; 5 7];
  B=[6 7 ; 8 9];
  i=columns(A);
  j=rows(A);
  h=columns(B);
  k=rows(B);
  disp('Suma de A + B')
  if i==h & j==k
    for n=1:i
      for m=1:j
        C(n,m)=A(n,m)+B(n,m);
      end
    end
  end
  disp(A)
  disp(B)
  disp(C)
end
