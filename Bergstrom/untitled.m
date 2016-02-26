function [ x, lamb ] = InvIter(A, x0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

maxiter = 20
xk = x0;
for i=1:maxiter
    xplus = A\xk;
    xk    = xplus/norm(xplus);
end
% Identity matrix of size m
I = eye(m);
% Shifted inverse iteration
disp('      Shifted Inverse Iteration')
k = 2;
while (norm(A*V(:,k-1) - lambda(k-1)*V(:,k-1), inf) > tol)  
    w = (A-lambda(1)*I) \ V(:,k-1);
    V(:,k) = w/norm(w);
    lambda(k) = V(:,k)'*A*V(:,k);
    disp(sprintf('lambda(%d) = %10.12f', k-1, lambda(k)))
    k = k+1;
end