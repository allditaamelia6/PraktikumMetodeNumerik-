clc;
clear;

A = [2 1 -1;
     4 3 1;
    -2 1 2];

b = [3; 9; 4];

n = length(b);

% Forward Elimination
for k = 1:n-1
    for i = k+1:n
        m = A(i,k) / A(k,k);

        for j = k:n
            A(i,j) = A(i,j) - m * A(k,j);
        end

        b(i) = b(i) - m * b(k);
    end
end

% Backward Substitution
x = zeros(n,1);

for i = n:-1:1
    jumlah = 0;

    for j = i+1:n
        jumlah = jumlah + A(i,j) * x(j);
    end

    x(i) = (b(i) - jumlah) / A(i,i);
end

disp('Hasil Eliminasi Gauss:');
disp(x);

