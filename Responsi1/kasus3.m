
clc;
clear;
close all;

% ==========================================
% KASUS 3: PERSAMAAN NONLINEAR
% Metode Biseksi
% Program GNU Octave
% ==========================================

% 1. Menentukan volume bola
Vbola = 300;

% Persamaan nonlinear:
% (4/3)*pi*r^3 - 300 = 0

f = @(r) (4/3) * pi * r.^3 - Vbola;

% 2. Membuat grafik untuk memperkirakan akar
r_grafik = linspace(0, 6, 500);

figure;

plot(r_grafik, f(r_grafik), 'b-', 'LineWidth', 1.5);

hold on;

plot(r_grafik, zeros(size(r_grafik)), 'k--');

grid on;

xlabel('Jari-jari (cm)');
ylabel('f(r)');

title('Grafik Persamaan Nonlinear');

legend('f(r)', 'f(r) = 0', 'location', 'best');

hold off;

% 3. Menentukan interval awal berdasarkan grafik
a = 4;
b = 5;

% Menentukan toleransi dan iterasi maksimum
toleransi = 0.0001;
maks_iterasi = 100;

% Memeriksa apakah interval mengurung akar
if f(a) * f(b) >= 0

    error('Interval awal tidak memenuhi syarat metode biseksi.');

end

% 4. Melakukan iterasi metode biseksi
fprintf('\nHASIL KASUS 3 - METODE BISEKSI\n');

fprintf('Iterasi       a             b             c          |f(c)|\n');

for iterasi = 1:maks_iterasi

    % Menghitung titik tengah interval
    c = (a + b) / 2;

    % Menghitung nilai fungsi pada titik tengah
    fc = f(c);

    fprintf('%3d      %.8f    %.8f    %.8f    %.8f\n', ...
        iterasi, a, b, c, abs(fc));

    % Memeriksa kriteria berhenti
    if abs(fc) < toleransi || (b - a) / 2 < toleransi

        break;

    end

    % Memperbarui interval yang mengurung akar
    if f(a) * fc < 0

        b = c;

    else

        a = c;

    end

end

% 5. Menghitung hasil akhir
r = c;

% Tinggi tabung sama dengan diameter bola
tinggi_tabung = 2 * r;

% Menghitung volume tabung
Vtabung = pi * r^2 * tinggi_tabung;

% Menghitung volume tabung di luar bola
Vluar = Vtabung - Vbola;

% 6. Menampilkan hasil
fprintf('\nHASIL AKHIR\n');

fprintf('Jari-jari bola dan tabung = %.8f cm\n', r);

fprintf('Tinggi tabung = %.8f cm\n', tinggi_tabung);

fprintf('Volume bola = %.8f cm^3\n', Vbola);

fprintf('Volume tabung = %.8f cm^3\n', Vtabung);

fprintf('Volume tabung di luar bola = %.8f cm^3\n', Vluar);

fprintf('Pemeriksaan f(r) = %.10f\n', f(r));


