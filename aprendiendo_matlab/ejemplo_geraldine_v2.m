%% ejemplo 1
clear;clc;
%establecemos la matrix A
A=[ 1   3  -3;
    4  -6   2;
    7   8  -1 ]   

%establecemos la matrix B
B=[ -1    1  -2;
     2    3   9;
     11   8  -7]    

%realizamos la siguiente operacion
operacion=inv(A*B)*1000



%% ejemplo 2
clear;clc;close all
%establecemos el los puntos de muestreo del parámetro
%establecemos las funciones a graficar
radio=1; %radio de la flor
numero_de_petalos=6;
angulo_phi=(0:0.01:2*pi);
alfa=numero_de_petalos*angulo_phi;

seno_phi=sin(angulo_phi);
coseno_phi=cos(angulo_phi);
coseno_alfa=cos(alfa);

x=radio*seno_phi.*coseno_alfa;
y=radio*coseno_phi.*coseno_alfa;    

figure 
hold
scatter(x(1),y(1),'filled','r')
xlim([-1 1])
ylim([-1 1])
for i=2:length(x)
    scatter(x(i),y(i),'filled','r')
    pause(0.0005)
end
%% entregable ejemplo 2_v1
x=0:0.09:2*pi;
y=sin(x);
plot(x,y)

%% entregable ejemplo 2_v2
clear;clc;close all
%establecemos el radio de la rosa a graficar
radio=1;
%ponemos la cantidad de petalos
numero_de_petalos=7;
%colocamos el rango del ángulo a recorrer
angulo_phi=(0:0.005:2*pi);
%establecemos una variable alfa para simplificar calculos
alfa=numero_de_petalos*angulo_phi;
%establecemos otras variables de pre-calculo
seno_phi=sin(angulo_phi);
coseno_phi=cos(angulo_phi);
coseno_alfa=cos(alfa);
%procedemos a obtener los valores x e y en funcion del angulo phi,
%conversion de polar a cartesiana
x=radio*seno_phi.*coseno_alfa;
y=radio*coseno_phi.*coseno_alfa;    
%graficamos la rosa
scatter(x,y,'filled','g')
%% plus ejem2 (two colors)
clear;clc;close all
%establecemos el radio de la rosa a graficar
radio=1;
%ponemos la cantidad de petalos
numero_de_petalos=6;
%colocamos el rango del ángulo a recorrer
angulo_phi=(0:0.005:pi);
%establecemos una variable alfa para simplificar calculos
alfa=numero_de_petalos*angulo_phi;
%establecemos otras variables de pre-calculo
seno_phi=sin(angulo_phi);
coseno_phi=cos(angulo_phi);
coseno_alfa=cos(alfa);
%procedemos a obtener los valores x e y en funcion del angulo phi
x=radio*seno_phi.*coseno_alfa;
y=radio*coseno_phi.*coseno_alfa;    
%graficamos la rosa
scatter(x,y,'filled','b')
hold
angulo_phi=(pi:0.005:2*pi);
alfa=numero_de_petalos*angulo_phi;
seno_phi=sin(angulo_phi);
coseno_phi=cos(angulo_phi);
coseno_alfa=cos(alfa);
x=radio*seno_phi.*coseno_alfa;
y=radio*coseno_phi.*coseno_alfa;    
scatter(x,y,'filled','g')