function final2023
  clc;clear
  # Tendencia de C(Dt)
  Dt = [1;0.5;0.25];
  CDt = [29.989;29.974;29.969];
  PHI = [Dt.^0 Dt.^2];
  a = transpose(PHI)*PHI\(transpose(PHI)*(1./CDt))

  disp("convergencia global")
  cg = 1/a(1)

  # Un valor entre 0.25 y 0. En este caso se eligió el siguiente elemento en la sucecion Dt(i)
  Dte = Dt(3)/2

  # z(t)
  M = 5*eye(5);
  K = [2 -1 0 0 0
  -1 2 -1 0 0
  0 -1 2 -1 0
  0 0 -1 2 -1
  0 0 0 -1 2];
  L = 60;
  z = zeros(5,1);
  v = [1/2;sqrt(3)/2;1;sqrt(3)/2;1/2];
  z_1 = -v(:,1)./Dte;
  z(:,2) = (2*eye(5)-Dte^2*inv(M)*K)*z(:,1)-z_1;
  t = (0:Dte:L)';
  for i=2*Dte:Dte:L
    z(:,end+1) = (2*eye(5)-Dte^2*inv(M)*K)*z(:,end)-z(:,end-1);
  end

  # v(t)
  for i=2:rows(t)-1
    v(:,end+1) = (1/(2*Dte))*(z(:,i-1) - z(:,i+1));
  end
  v(:,end+1) = (1/2*(Dte))*(z(:,end-2) - 4*z(:,end-1) + 3*z(:,end));

  # z(3)
  figure(1);
  plot(t,z(3,:),t,v(3,:));
  grid on;

  for i=1:columns(z)-1
    if v(3,i) <= 0 || v(3,i+1) <= 0
      continue;
    end
    if z(3,i)*z(3,i+1) <= 0
      tk = t(i)
      tk1 = t(i+1)
      roots = [i i+1];
      break;
    end
  end

  ztk = z(:,roots(1))
  ztk1 = z(:,roots(2))

  vtk = v(:,roots(1))
  vtk1 = v(:,roots(2))
