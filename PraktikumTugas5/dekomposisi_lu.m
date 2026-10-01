clc;
clear;

A = [2 1 -1;
     4 3 1;
    -2 1 2];

b = [3; 9; 4];

n = size(A,1);

L = eye(n);
U = A;

% Proses eliminasi untuk mendapatkan L dan U
for k = 1:n-1
    for i = k+1:n

        m = U(i,k) / U(k,k);

        L(i,k) = m;

        U(i,:) = U(i,:) - m * U(k,:);
    end
end

% Forward substitution: Ly = b
y = zeros(n,1);

for i = 1:n
    jumlah = 0;

    for j = 1:i-1
        jumlah = jumlah + L(i,j) * y(j);
    end

    y(i) = (b(i) - jumlah) / L(i,i);
end

% Backward substitution: Ux = y
x = zeros(n,1);

for i = n:-1:1
    jumlah = 0;

    for j = i+1:n
        jumlah = jumlah + U(i,j) * x(j);
    end

    x(i) = (y(i) - jumlah) / U(i,i);
end

disp('Matriks L:');
disp(L);

disp('Matriks U:');
disp(U);

disp('Nilai y:');
disp(y);

disp('Hasil Dekomposisi LU:');
disp(x);

disp('Cek A = L*U:');
disp(L*U);

