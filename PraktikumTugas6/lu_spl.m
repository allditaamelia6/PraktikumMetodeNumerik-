clc;
clear;

A = [5 -1 -1 0 0;
    -1 5 -1 -1 0;
    -1 -1 4 -1 -1;
     0 0 1 4 -2;
     0 1 -1 1 4];

b = [-1; 2; 6; 2; -1];

% Dekomposisi LU
[L,U] = lu(A);

% Ly = b
y = L\b;

% Ux = y
x = U\y;

disp('Matriks L:');
disp(L);

disp('Matriks U:');
disp(U);

disp('Hasil Dekomposisi LU:');
disp(x);

