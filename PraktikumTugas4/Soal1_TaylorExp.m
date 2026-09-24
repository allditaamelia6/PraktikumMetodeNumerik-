clc;
clear;

x = 0.3;
nilai_eksak = exp(x);

fprintf('PERHITUNGAN e^0.3 DENGAN DERET TAYLOR\n');
fprintf('Nilai eksak = %.10f\n\n', nilai_eksak);

for n = 0:4
  hasil = 0;

  for i = 0:n
    hasil = hasil + (x^i / factorial(i));

  end

  galat = abs(nilai_eksak - hasil);
  galat_relatif = (galat / abs(nilai_eksak)) * 100;

  fprintf('n = %d\n', n);
  fprintf('Hasil pendekatan = %.10f\n', hasil);
  fprintf('Galat absolut    = %.10f\n', galat);
  fprintf('Galat relatif    = %.6f %%\n\n', galat_relatif);
end

