clc;
clear;
close all;


%% NO 1 - FOR LOOP
disp('===== NO 1 - FOR LOOP =====');

for i = 1:5
    p = i^2
end


%% NO 2 - FOR LOOP DENGAN INTERVAL
disp('===== NO 2 - FOR LOOP INTERVAL =====');

for j = 1:0.5:5
    q = j/2
end


%% NO 3 - WHILE LOOP
disp('===== NO 3 - WHILE LOOP =====');

p = 1;

while (p <= 6)
    q = p^2 + p
    p = p + 1;
end


%% NO 4 - CONTINUE
disp('===== NO 4 - CONTINUE =====');

for i = 1:5
    if (i == 3)
        continue
    end

    p = i^2
end


%% NO 5 - BREAK
disp('===== NO 5 - BREAK =====');

for i = 1:5
    if (i == 4)
        break
    end

    p = i^2
end


%% NO 6 - DIFFERENSIAL
disp('===== NO 6 - DIFFERENSIAL =====');

pkg load symbolic

syms x

f = input('Masukkan bentuk persamaan f(x) = ', 's');
f_asli = sym(f);
f_turunan = diff(f_asli, 'x')



%% NO 7 - INTEGRAL
disp('===== NO 7 - INTEGRAL =====');

syms x

f = input('Masukkan bentuk persamaan f(x) = ', 's');
f_asli = sym(f);
f_integral = int(f_asli, 'x')


%% NO 8 - FUNCTION DENGAN 1 NILAI RETURN
disp('===== NO 8 - FUNCTION 1 RETURN =====');

a = doubleit(7)


%% NO 9 - FUNCTION DENGAN BEBERAPA NILAI RETURN
disp('===== NO 9 - FUNCTION MULTIPLE RETURN =====');

[x, y] = multi(4, 5)


%% NO 10 - FUNCTION DENGAN RETURN
disp('===== NO 10 - FUNCTION DENGAN RETURN =====');

b = doubleitReturn(8)


%% NO 11 - ANONYMOUS FUNCTION
disp('===== NO 11 - ANONYMOUS FUNCTION =====');

squared = @(x) x.^2;

hasil1 = squared(5)
hasil2 = squared(1:5)


addition = @(x,y) x+y;

hasil3 = addition(8,12)


%% NO 12 - GRAFIK GARIS 2D
disp('===== NO 12 - GRAFIK GARIS 2D =====');

x = 1:5:100;
y = x.^3 + 2*x.^2 - 40*x;

figure;
plot(x,y);
grid on;
title('Grafik Persamaan y = x^3 + 2x^2 - 40x');
xlabel('Sumbu X');
ylabel('Sumbu Y');


%% NO 13 - GRAFIK 2D DENGAN LINSPACE
disp('===== NO 13 - GRAFIK 2D LINSPACE =====');

x = linspace(0,20);
y = exp(-x/4).*sin(x);

figure;
plot(x,y);
grid on;
xlabel('Sumbu X');
ylabel('Sumbu Y');
title('Grafik persamaan f(x)=exp(-x/4).*sin(x)');


%% NO 14 - GRAFIK 2D DUA KURVA
disp('===== NO 14 - GRAFIK 2D DUA KURVA =====');

x = 0:0.01:2*pi;

y = -10*sin(2*x) - 8*cos(3*x);
z = 8*sin(6*x).*-6.*cos(10*x);

figure;
plot(x,y,x,z);
grid on;
xlabel('Sumbu X');
ylabel('Sumbu Y');
title('Grafik Dua Persamaan');


%% NO 15 - GRAFIK GARIS 3D / LINE PLOT
disp('===== NO 15 - GRAFIK 3D LINE PLOT =====');

t = 0:0.1:6*pi;

x = sqrt(t).*sin(2*t);
y = sqrt(t).*cos(2*t);
z = 0.5*t;

figure;
plot3(x,y,z,'k','linewidth',1);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('Grafik Garis 3D');


%% NO 16 - GRAFIK 3D MESH PLOT
disp('===== NO 16 - GRAFIK 3D MESH PLOT =====');

x = -7.3:0.5:7.5;
y = x;

[X,Y] = meshgrid(x,y);

R = sqrt(X.^2 + Y.^2);
Z = sin(R)./R;

figure;
mesh(X,Y,Z);
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Grafik 3D Mesh Plot');


%% NO 17 - MESHGRID
disp('===== NO 17 - MESHGRID =====');

x = [1,2,3];
y = [10,20];

[X,Y] = meshgrid(x,y)

% Menampilkan hasil koordinat grid
disp('Matriks X:');
disp(X);

disp('Matriks Y:');
disp(Y);


%% NO 18 - GRAFIK CONTOUR 3D
disp('===== NO 18 - CONTOUR PLOT =====');

x = -3:0.25:3;
y = -3:0.25:3;

[X,Y] = meshgrid(x,y);

Z = 1.8.^(-1.5*sqrt(X.^2+Y.^2)).*cos(0.5*Y).*sin(X);

figure;
contour3(X,Y,Z,15);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('Grafik Garis 3D Contour Plot');


disp(' ');
disp('===== SEMUA PROGRAM SELESAI DIJALANKAN =====');


function result = doubleit(param)
    result = 2*param;
end


function [mult2,mult3] = multi(param1,param2)
    mult2 = param1*2;
    mult3 = param2*3;
end


function result = doubleitReturn(param)
    result = 0;
    return

    result = 2*param;
end
