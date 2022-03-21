%% Lagrange's Interpolation
% This script takes points and prints the Lagrange's polynomial,
% approximate value at a point and also plots the graph of interpolating polynomial

%  variables
% x = x points, y = y points, x_int = point for approximation
% n = number of points, L = multiplication of basis and f(x)
% P = interpolating polynomial, y_int = approximation at x_int
% x_plot = matrix storing 100 equal spaced point between first and last x point
% y_plot = matrix storing polynomial value of x_plot

%% Initialization
x=input('Enter the x data points(eg, [2;3;5]): ');
y=input('Enter the y data points(eg, [5;7;8]): ');
x_int=input('Enter the point for approximation: ');

% checks if length of x is equal to length of y
if length(x)~=length(y)
    error('Length Mismatch');
end

n=length(x); % number of points
L=zeros(n,n);

%% Main loop
for i=1:n
    temp=1;
    for j=1:n
        if i~=j
            temp=conv(temp,poly(x(j)))/(x(i)-x(j)); % calculates the Lagrangian basis
        end
    end
    L(i,:)=temp*y(i); % multiplication of Lagrangian basis and f(x)
end
P=sum(L); % interpolating polynomial

%% Prints the interpolating polynomial
fprintf('The interpolating polynomial is:\n')
for i=n:-1:2
    fprintf(' %+ .4fx^%i',P(end-i+1),i-1);
end
fprintf(' %+.4f\n',P(end));

%% Calculating the approximate value at given point
y_int=polyval(P,x_int);
fprintf('Approximate value at given data point is: %.4f\n', y_int)

%% Plots the interpolating polynomial and marks the given data points
x_plot=linspace(x(1),x(n),100); 
y_plot=polyval(P,x_plot);
plot(x_plot,y_plot,'r',x,y,'o')
xlabel('x');ylabel('y');
title('Graph of Interpolating Polynomial');