%establecemos los valores de x a graficar
x=0:0.09:10*pi; %para alargar la grafica, cambiar el valor final de x
%hallamos los valores de y, evaluando x en y(x)
y=sin(x);
%graficamos la curva
plot(x,y)