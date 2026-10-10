clc;
clear;

A = [5 -1 -1 0 0;
    -1 5 -1 -1 0;
    -1 -1 4 -1 -1;
     0 0 1 4 -2;
     0 1 -1 1 4];

b = [-1; 2; 6; 2; -1];

M = [A b];
n = length(b);

% Gauss-Jordan
for k = 1:n

    % Membuat pivot menjadi 1
    M(k,:) = M(k,:) / M(k,k);

    % Membuat elemen lain pada kolom pivot menjadi 0
    for i = 1:n
        if i ~= k
            M(i,:) = M(i,:) - M(i,k)*M(k,:);
        end
    end
end

x = M(:,n+1);

disp('Hasil Gauss-Jordan:');
disp(x);

