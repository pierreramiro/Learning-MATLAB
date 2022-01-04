%%
clear;clc;close all
%establecemos el los puntos de muestreo del parámetro
parametro_t=(0:0.00001:0.55);
%establecemos las funciones a graficar
radio=1; %radio de la esfera
angulo_phi=-2*pi/T*t;
numero_de_petalos=7;
angulo_rotacion=-0.5853;
alfa=-angulo_rotacion/2/pi*angulo_phi;
sen_phi=sin(angulo_phi);

seno_alfa=sin(alfa);
coseno_alfa=cos(alfa);

x=(radio*sen_phi).*seno_alfa;
y=(radio*-sen_phi).*coseno_alfa;    
z=-radio.*cos(angulo_phi);

scatter3(x,y,z,'filled','r')
