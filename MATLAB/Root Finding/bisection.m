%% Script file to calculate root of an equation using Bisection method
% 
% Variables
% a= lower limit, b=upper limit, iter= number of iteration for calculation,
% tol= error tolerance, f= calculating function/equation
% 
% error=matrix/array for storing error in each steps,iteration=matrix/array for storing iteration,
% root=matrix/array for storing roots, fx=matrix/array for storing functional value in each steps
% 
%% Initialization

% a=input('Enter lower limit: ');
% b=input('Enter upper limit: ');
% iter=input('Enter maximum iteration number: ');
% tol=input('Enter tolerance: ');
% f=input('Enter function (e.g. @(x) x^3-3): ');

% check if a root is present in given interval
while(f(a)*f(b)>0)
    disp('No root in the given interval. Try again');
    a=input('Enter lower limit: ');
    b=input('Enter upper limit: ');
end

% for printing table header
fprintf('iteration\t a\t\t\t\t b\t\t\t Root\t\t\t f(x)\t\t Error\n');
%% Main loop
for i=1:iter
    iteration(i)=i;     % iteration (needed for plotting)
    root(i)=(a+b)/2;    % main formula
    error(i)=(b-a)/2;   % error calculation
    fx(i)=f(root(i));   % functional value at root
    
    % printing table
    fprintf('%3i  %13.8f  %13.8f  %13.8f  %13.8f  %13.8f\n',i,a,b,root(i),fx(i),error(i));
    
    % Break condition 
    if (f(root(i))==0 || error(i)<tol)
        fprintf('Root is %.8f\n',root(i));
        break
    end
    
    % Break condition if no root is found in given iteration
    if(i==iter)
        fprintf('No root is found after %3i iterations. Try with large number of iteration.\n',i);
    end
    
    % changing the interval
    if f(a)*fx(i) < 0
        b = root(i);
    else
        a = root(i);
    end
end
%% for plotting error in each step of Bisection method
figure(1)
plot(iteration,error,'r-x');
xlabel('Iteration');
ylabel('Error');
legend('Bisection method');
title('Error in bisection method')