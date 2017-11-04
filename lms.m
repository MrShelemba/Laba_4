function [y,e,w] = lms(x,d,mu,L)
x = x(:); d = d(:);
M = length(x);  y = zeros(M,1); 
e = zeros(M,1); w = zeros(L,1);
for k = L:M
    xk = x(k:-1:k-L+1); 
    y(k) = w'*xk;  
    e(k) = d(k)-y(k); 
    w = w + 2*mu*e(k)*xk; 
end
