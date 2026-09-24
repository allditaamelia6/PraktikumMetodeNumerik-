clc;
clear;

hasil_eksak= 0;

for i = 1:20
  hasil_eksak = hasil_eksak + 1/i;
end

hasil_bulat = 0;

for i = 1:20
  pembagian = round((1/i) * 100) / 100;
  hasil_bulat = hasil_bulat + pembagian;
end

hasil_sum = sum(1 ./ (1:20));

error_bulat = abs(hasil_eksak - hasil_bulat);
error_sum = abs(hasil_eksak - hasil_sum);

fprintf('PERHITUNGAN 1 + 1/2 + ... + 1/20\n\n');

fprintf('a. hasil eksak               = %.10f\n', hasil_eksak);
fprintf('b. Hasil dengan pembulatan   = %.10f\n', hasil_bulat);
fprintf('c. Hasil menggunakan sum     = %.10f\n\n', hasil_sum);

fprintf('Error pembulatan = %.10f\n', error_bulat);
fprintf('Error sum        = %.10f\n', error_sum);

