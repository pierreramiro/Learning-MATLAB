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
