%% Calculating root of an equation using Newton Raphson method
% 
% Variables
% a = initial guess, iter = maximum number of iteration for calculation,
% tol = error tolerance, f = calculating function/equation,
% fprime = first derivative of f
% 
% error = matrix/array for storing error in each steps, iteration = matrix/array for storing iteration,
% root = matrix/array for storing roots, fx = matrix/array for storing functional value in each steps
% 
%% Initialization
f=input('Enter function (e.g. @(x) x^3-3): '); 
fprime=input('Enter first derivative of function (e.g. @(x) 3*x^2): ');
a=input('Initial guess: ');
iter=input('Number of iteration: ');
tol=input('Tolerance (eg. 1e-5): ');

% For printing table header
fprintf('Iteration    Root     f(x)          Error\n');
%% Main loop
for i=1:iter
    % checks if the first derivative is computable or not
    if fprime(a)==0 || fprime(a)==Inf
        fprintf('Division by zero\n');
        break;
    end
    root(i)=a-(f(a)/(fprime(a))); % main formula
    iteration(i)=i;               % iteration (needed for plotting)
    fx(i)=f(root(i));             % functional value at root
    error(i)=abs(a-root(i));      % error calculation
    
    % prints the table
    fprintf('%3i   %11.8f  %11.8f  %11.8f\n',i,root(i),fx(i),error(i));
    
    % Break condition 
    if(fx(i)==0 || error(i)<tol)
        fprintf('Root is %11.8f\n',root(i));
        break
    end
    
    % Break condition if no root is found in given iteration
    if(i==iter)
        fprintf('No root is found after %3i iterations. Try with large number of iteration.\n',i);
        break
    end
    
    a=root(i); % swaps the root
end

%% for plotting error in each step of Newton Raphson method
plot(iteration,error,'r-x');
xlabel('Iteration');
ylabel('Error');
legend('Newton Raphson Errors');
title('Error in Newton Raphson method')