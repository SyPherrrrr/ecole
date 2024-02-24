clear all
R = 100
l = 10
psi = linspace(0,2*%pi,360); // Vecteur de 360 lignes de 360 valeurs
rho = l*cos(psi) + sqrt(R^2 - l^2*(sin(psi)^2));

figure
plot(psi*180/%pi,rho);
title('Evolution de la course de la palette');
xlabel('psi (en degrés)');
ylabel('rho (en mm)');