
clc;
clear;

% ==========================================
% METODE REGULA-FALSI
% SISTEM PERSAMAAN NON-LINEAR
% Maksimal iterasi = 20
% Toleransi error = 0.0001
% ==========================================

f{1} = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
f{2} = @(x) exp(x) - x.^2;
f{3} = @(x) log(x+2) + 2*x - 3;

% Interval awal setiap persamaan
a_awal = [1, -1, 0];
b_awal = [2,  1, 1];

nama = {
    'Persamaan 1'
    'Persamaan 2'
    'Persamaan 3'
};

maks_iterasi = 20;
toleransi = 0.0001;

for j = 1:3

    fprintf('\n====================================\n');
    fprintf('REGULA-FALSI - %s\n', nama{j});
    fprintf('====================================\n');

    a = a_awal(j);
    b = b_awal(j);

    % Memeriksa syarat interval awal
    if f{j}(a) * f{j}(b) >= 0
        fprintf('Interval awal tidak memenuhi syarat.\n');
        fprintf('Silakan pilih interval yang berbeda tanda.\n');
        continue;
    end

    fprintf('%5s %12s %12s %12s %15s %12s\n', ...
        'Iter', 'a', 'b', 'c', 'f(c)', 'Error');

    c_lama = NaN;

    for i = 1:maks_iterasi

        % Menghitung nilai fungsi pada batas interval
        fa = f{j}(a);
        fb = f{j}(b);

        % Menghitung titik pendekatan Regula-Falsi
        c = (a*fb-b*fa)/(fb-fa);
        fc = f{j}(c);

        % Menghitung error
        if i == 1
            error = NaN;
        else
            error = abs(c-c_lama);
        end

        % Menampilkan hasil iterasi
        fprintf('%5d %12.6f %12.6f %12.6f %15.8f %12.6f\n', ...
            i, a, b, c, fc, error);

        % Menghentikan iterasi jika toleransi terpenuhi
        if fc == 0 || abs(fc) < toleransi || ...
                (i > 1 && error < toleransi)
            break;
        end

        % Memperbarui interval
        if fa*fc < 0
            b = c;
        else
            a = c;
        end

        c_lama = c;

    end

    fprintf('Perkiraan akar = %.8f\n', c);
    fprintf('Nilai f(akar) = %.8f\n', f{j}(c));

end


