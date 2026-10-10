clc;
clear;

% Nilai awal
p = 0;
q = 0;
r = 0;
s = 0;
t = 0;

% Jumlah iterasi
iterasi = 10;

for k = 1:iterasi

    % Perhitungan nilai baru
    p_baru = (-1 + q + r) / 5;
    q_baru = (2 + p + r + s) / 5;
    r_baru = (6 + p + q + s + t) / 4;
    s_baru = (2 - r + 2*t) / 4;
    t_baru = (-1 - q + r - s) / 4;

    % Update semua nilai secara bersamaan
    p = p_baru;
    q = q_baru;
    r = r_baru;
    s = s_baru;
    t = t_baru;

    fprintf('Iterasi %d:\n', k);
    fprintf('p = %.6f\n', p);
    fprintf('q = %.6f\n', q);
    fprintf('r = %.6f\n', r);
    fprintf('s = %.6f\n', s);
    fprintf('t = %.6f\n\n', t);
end

