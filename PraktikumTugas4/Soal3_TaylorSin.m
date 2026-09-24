clc;
clear;

x = 1;
nilai_eksak = sin(x);

fprintf('PERHITUNGAN sin(1) DENGAN DERET TAYLOR\n');
fprintf('Nilai eksak = %.10f\n\n', nilai_eksak);

for N = 1:5
  hasil = 0;

  for n = 0:N
    hasil = hasil + ((-1)^n * x^(2*n+1)) / factorial(2*n+1);
  end

  galat = abs(nilai_eksak - hasil);
  galat_relatif = (galat / abs(nilai_eksak)) * 100;

  fprintf('N = %d\n', N);
  fprintf('Hasil pendekatan = %.10f\n', hasil);
  fprintf('Galat absolut    = %.10f\n', galat);
  fprintf('Galat relatif    = %.8f %%\n\n', galat_relatif);
end

