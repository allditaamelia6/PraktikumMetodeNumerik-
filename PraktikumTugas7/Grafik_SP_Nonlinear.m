
clc;
clear;
close all;

% ==========================================
% GRAFIK TUNGGAL DAN GRAFIK GANDA
% SISTEM PERSAMAAN NON-LINEAR
% ==========================================

% Persamaan 1:
% y = 3x^3 - 5x^2 + 4x - 7 dan y = 1
f1 = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;

% Persamaan 2:
% y = exp(x) - x^2 dan y = 0
f2 = @(x) exp(x) - x.^2;

% Persamaan 3:
% y = log(x+2) + 2x - 3 dan y = 0
f3 = @(x) log(x+2) + 2*x - 3;

% ==========================================
% GRAFIK TUNGGAL
% ==========================================

figure(1);

x1 = linspace(0, 3, 500);
subplot(3,1,1);
plot(x1, f1(x1), 'b', 'LineWidth', 1.5);
hold on;
plot(x1, zeros(size(x1)), 'r--');
grid on;
title('Grafik Tunggal Persamaan 1');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'y = 0');
hold off;

x2 = linspace(-2, 2, 500);
subplot(3,1,2);
plot(x2, f2(x2), 'b', 'LineWidth', 1.5);
hold on;
plot(x2, zeros(size(x2)), 'r--');
grid on;
title('Grafik Tunggal Persamaan 2');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'y = 0');
hold off;

x3 = linspace(-1.9, 3, 500);
subplot(3,1,3);
plot(x3, f3(x3), 'b', 'LineWidth', 1.5);
hold on;
plot(x3, zeros(size(x3)), 'r--');
grid on;
title('Grafik Tunggal Persamaan 3');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'y = 0');
hold off;

% ==========================================
% GRAFIK GANDA
% ==========================================

figure(2);

% Persamaan 1
x = linspace(0, 3, 500);
subplot(3,1,1);
plot(x, 3*x.^3 - 5*x.^2 + 4*x - 7, 'b', 'LineWidth', 1.5);
hold on;
plot(x, ones(size(x)), 'r--', 'LineWidth', 1.5);
grid on;
title('Grafik Ganda Persamaan 1');
xlabel('x');
ylabel('y');
legend('y = 3x^3 - 5x^2 + 4x - 7', 'y = 1');
hold off;

% Persamaan 2
x = linspace(-2, 2, 500);
subplot(3,1,2);
plot(x, exp(x) - x.^2, 'b', 'LineWidth', 1.5);
hold on;
plot(x, zeros(size(x)), 'r--', 'LineWidth', 1.5);
grid on;
title('Grafik Ganda Persamaan 2');
xlabel('x');
ylabel('y');
legend('y = exp(x) - x^2', 'y = 0');
hold off;

% Persamaan 3
x = linspace(-1.9, 3, 500);
subplot(3,1,3);
plot(x, log(x+2) + 2*x - 3, 'b', 'LineWidth', 1.5);
hold on;
plot(x, zeros(size(x)), 'r--', 'LineWidth', 1.5);
grid on;
title('Grafik Ganda Persamaan 3');
xlabel('x');
ylabel('y');
legend('y = log(x+2) + 2x - 3', 'y = 0');
hold off;


