%% Newton's Forward Difference Interpolation
% This script takes points and prints the interpolating polynomial,
% approximate value at a point and also plots the graph of interpolating polynomial

%  variables
% x = x points, y = y points, x_int = point for approximation
% n = number of points, table = forward difference table (first values are in diagonal)
% h = step size, a = first x point
% P = interpolating polynomial, y_int = approximation at x_int
% x_plot = matrix storing 100 equal spaced point between first and last x point
% y_plot = matrix storing polynomial value of x_plot

%% Initialization
x = input('Enter the x data points(eg, [2;3;4;5;6]): ');
y = input('Enter the y data points(eg, [4;7;8;11;15]): ');
x_int = input('Enter the point for approximation: ');

% checks if length of x is equal to length of y
if length(x) ~= length(y)
    error('Length Mismatch');
end

a = x(1);
h = x(2)-x(1);
n = length(x);
table = zeros(n, n);
table(:, 1) = y; % stores the y points in the first column of table

%% calculating the forward difference table
for j = 2:n
    for i = j:n
        table(i, j) = table(i, j-1) - table(i-1, j-1);
    end
end

%% calculating the interpolating polynomial
P = table(n, n);
for i = n-1:-1:1
    u = poly(a)/h;
    u(2) = u(2)-(i-1);
    P = conv(P, u)/i;
    P(end) = P(end)+table(i, i);
end

%% printing the interpolating polynomial
fprintf('The polynomial is: \n');
for i = n:-1:2
    fprintf(' %+.4fx^%i',P(end-i+1), i-1);
end
fprintf(' %+.4f\n',P(end));

%% calculating the approximation value at given point
y_int = polyval(P, x_int);
fprintf('The approx value is %.4f\n', y_int);

%% Plots the interpolating polynomial
x_plot = linspace(x(1), x(n), 100);
y_plot = polyval(P, x_plot);
plot(x_plot, y_plot, 'r', x, y, 'o');
xlabel('x');
ylabel('y');
title('Graph of interpolating polynomial');