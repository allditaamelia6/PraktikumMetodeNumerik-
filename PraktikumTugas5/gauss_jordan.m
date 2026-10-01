clc;
clear;

A = [2 1 -1;
     4 3 1;
    -2 1 2];

b = [3; 9; 4];

M = [A b];

n = size(A,1);

% Gauss-Jordan
for k = 1:n

    % Membuat pivot menjadi 1
    M(k,:) = M(k,:) / M(k,k);

    % Menghilangkan elemen pada kolom pivot
    for i = 1:n
        if i ~= k
            m = M(i,k);
            M(i,:) = M(i,:) - m * M(k,:);
        end
    end
end

x = M(:,n+1);

disp('Matriks hasil Gauss-Jordan:');
disp(M);

disp('Hasil Gauss-Jordan:');
disp(x);

