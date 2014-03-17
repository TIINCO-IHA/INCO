function c = cyclicEncoding(g,m,n,k)
% cyclicEncoding is a function that encodes a message vector into systematic code given the following parameters
% g is the generator polynomial in vector form
% m is message vector
% n is the code length. Default 15.
% k is the message length. Default 7.

if(nargin < 3)
    n = 15;
    k = 7;
end

% Form the polynomial X^(n-k)*m(X) by right-shifting m n-k times 
shifted_m = [zeros(1,n-k) m];

% Find the remainder, p, by dividing shifted_m by g over GF(2) (q is a factor)
[q, p] = gfdeconv(shifted_m,g,2);

% Extend p with zeros to having the length of n (to be able to add p with shifted_m)
p = [p zeros(1, n-length(p))];

% Obtain the code vector c by using binary addition to add shifted_m and p 
c = mod(shifted_m+p,2);
