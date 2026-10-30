
clc;
clear;
close all;

% ==========================================
% KASUS 1: GALAT DAN ERROR PEMOTONGAN
% Program GNU Octave
% ==========================================

% 1. Memasukkan data yang diketahui
lambda = 12;
v = 36;
x = 10;
h0 = 5;

% Membuat rentang waktu dari 0 sampai 5
t = linspace(0, 5, 1001);

% Menghitung argumen fungsi cosinus
z = t .* v ./ lambda;

% 2. Menghitung fungsi eksak
h_eksak = h0 .* (cos(z) + exp(x));

% Menentukan batas iterasi
N = [23, 24, 25];

% Menyiapkan tempat penyimpanan hasil
hasil = zeros(length(N), length(t));
galat_mutlak = zeros(1, length(N));
galat_relatif = zeros(1, length(N));

% 3. Menghitung fungsi pendekatan
for i = 1:length(N)

    n = N(i);

    % Pendekatan fungsi cosinus menggunakan deret Taylor
    cos_approx = zeros(size(z));

    for k = 0:n
        cos_approx = cos_approx + ...
            ((-1)^k .* z.^(2*k)) ./ factorial(2*k);
    end

    % Pendekatan fungsi eksponensial menggunakan deret Taylor
    exp_approx = 0;

    for k = 0:n
        exp_approx = exp_approx + x^k / factorial(k);
    end

    % Menghitung fungsi pendekatan gelombang
    hasil(i,:) = h0 .* (cos_approx + exp_approx);

    % Menghitung galat mutlak setiap titik
    galat = abs(hasil(i,:) - h_eksak);

    % Menghitung rata-rata galat mutlak
    galat_mutlak(i) = mean(galat);

    % Menghitung rata-rata galat relatif dalam persen
    galat_relatif(i) = ...
        mean(galat ./ abs(h_eksak)) * 100;

end

% 4. Membuat grafik perbandingan
figure;

plot(t, h_eksak, 'k-', 'LineWidth', 2);
hold on;

plot(t, hasil(1,:), 'r--', 'LineWidth', 1.5);
plot(t, hasil(2,:), 'b-.', 'LineWidth', 1.5);
plot(t, hasil(3,:), 'g:', 'LineWidth', 1.8);

grid on;

xlabel('Waktu (t)');
ylabel('Ketinggian gelombang (h)');

title('Perbandingan Fungsi Eksak dan Pendekatan Taylor');

legend('Fungsi Eksak', ...
       'Pendekatan n = 23', ...
       'Pendekatan n = 24', ...
       'Pendekatan n = 25', ...
       'location', 'best');

hold off;

% 5. Menampilkan hasil perhitungan
fprintf('\nHASIL KASUS 1\n');
fprintf('========================================\n');

for i = 1:length(N)

    fprintf('Batas iterasi n = %d\n', N(i));

    fprintf('Rata-rata galat mutlak = %.10f\n', ...
        galat_mutlak(i));

    fprintf('Rata-rata galat relatif = %.10f persen\n\n', ...
        galat_relatif(i));

end

% 6. Memeriksa toleransi error sebesar 1 persen
fprintf('PEMERIKSAAN TOLERANSI ERROR\n');

for i = 1:length(N)

    if galat_relatif(i) < 1
        fprintf('n = %d memenuhi toleransi 1 persen.\n', N(i));
    else
        fprintf('n = %d tidak memenuhi toleransi 1 persen.\n', N(i));
    end

end


