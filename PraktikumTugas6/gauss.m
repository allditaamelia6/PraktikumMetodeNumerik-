clc;
clear;

A = [5 -1 -1 0 0;
    -1 5 -1 -1 0;
    -1 -1 4 -1 -1;
     0 0 1 4 -2;
     0 1 -1 1 4];

b = [-1; 2; 6; 2; -1];

n = length(b);

% Eliminasi Gauss
for k = 1:n-1
    for i = k+1:n
        m = A(i,k) / A(k,k);
        A(i,:) = A(i,:) - m*A(k,:);
        b(i) = b(i) - m*b(k);
    end
end

% Substitusi mundur
x = zeros(n,1);

for i = n:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n)) / A(i,i);
end

disp('Hasil Eliminasi Gauss:');
disp(x);clc;
clear;

A = [5 -1 -1 0 0;
    -1 5 -1 -1 0;
    -1 -1 4 -1 -1;
     0 0 1 4 -2;
     0 1 -1 1 4];

b = [-1; 2; 6; 2; -1];

n = length(b);

% Eliminasi Gauss
for k = 1:n-1
    for i = k+1:n
        m = A(i,k) / A(k,k);
        A(i,:) = A(i,:) - m*A(k,:);
        b(i) = b(i) - m*b(k);
    end
end

% Substitusi mundur
x = zeros(n,1);

for i = n:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n)) / A(i,i);
end

disp('Hasil Eliminasi Gauss:');
disp(x);

