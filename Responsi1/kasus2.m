
clc;
clear;
close all;

% ==========================================
% KASUS 2: SISTEM PERSAMAAN LINEAR
% Metode Eliminasi Gauss
% Program GNU Octave
% ==========================================

% Variabel:
% x(1) = harga beras per kg
% x(2) = harga telur per kg
% x(3) = harga tepung per kg
% x(4) = harga ayam per kg

% 1. Membentuk matriks koefisien
% Semua massa sudah dikonversi ke kilogram.

A = [2.5  1.5   5.0  0.5;
     4.0  0.75  1.0  2.0;
     2.0  1.5   0.5  6.0;
     1.0  4.25  2.0  0.9];

% 2. Membentuk vektor total belanja
b = [161000;
     149000;
     251500;
     173000];

% 3. Menampilkan sistem persamaan
fprintf('\nHASIL KASUS 2\n');
fprintf('========================================\n');

% Memeriksa determinan matriks koefisien
det_A = det(A);

fprintf('Determinan matriks A = %.6f\n', det_A);

if abs(det_A) < 1e-10
    error('Matriks singular. Solusi tunggal tidak tersedia.');
end

% Membentuk matriks augmented
Ab = [A b];

n = size(A, 1);

% 4. Eliminasi maju metode Gauss
for k = 1:n-1

    % Pivoting parsial untuk memilih elemen pivot
    [~, posisi] = max(abs(Ab(k:n, k)));

    posisi = posisi + k - 1;

    % Menukar baris jika diperlukan
    if posisi ~= k

        sementara = Ab(k, :);

        Ab(k, :) = Ab(posisi, :);

        Ab(posisi, :) = sementara;

    end

    % Menghilangkan elemen di bawah pivot
    for i = k+1:n

        faktor = Ab(i, k) / Ab(k, k);

        Ab(i, k:n+1) = ...
            Ab(i, k:n+1) - faktor * Ab(k, k:n+1);

    end

end

% 5. Substitusi mundur
harga = zeros(n, 1);

for i = n:-1:1

    harga(i) = ...
        (Ab(i, n+1) - Ab(i, i+1:n) * harga(i+1:n)) ...
        / Ab(i, i);

end

% 6. Menampilkan harga setiap bahan
nama = {'Beras', 'Telur', 'Tepung', 'Ayam'};

fprintf('\nHARGA BAHAN MAKANAN PER KILOGRAM\n');

for i = 1:n

    fprintf('Harga %s = Rp %.2f per kg\n', ...
        nama{i}, harga(i));

end

% 7. Memeriksa kembali hasil perhitungan
total_cek = A * harga;

fprintf('\nPEMERIKSAAN TOTAL BELANJA\n');

fprintf('Adel  : Rp %.2f\n', total_cek(1));
fprintf('Briza : Rp %.2f\n', total_cek(2));
fprintf('Caca  : Rp %.2f\n', total_cek(3));
fprintf('Dinda : Rp %.2f\n', total_cek(4));

fprintf('\nTotal belanja dibandingkan dengan data soal.\n');


