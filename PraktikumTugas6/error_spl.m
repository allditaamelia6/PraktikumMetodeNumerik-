clc;
clear;

% Hasil metode langsung
x_l = [0.32544;
       0.83235;
       1.79487;
       0.04142;
      -0.01972];

% Hasil Jacobi iterasi ke-2
x_j = [0.18;
       0.76;
       1.6125;
       0;
      -0.1];

% Hasil Gauss-Seidel iterasi ke-2
x_gs = [0.18;
        0.767;
        1.76956;
        0.06573;
       -0.01579];

% Error absolut
error_jacobi = abs(x_l - x_j);
error_gs = abs(x_l - x_gs);

disp('Error Jacobi:');
disp(error_jacobi);

disp('Error Gauss-Seidel:');
disp(error_gs);

