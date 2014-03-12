clc, clear

%%Meggitt decoder

%g(x) = 1 + x + x^3
g = [1 1 0 1];

%v(x)
v = [1 0 0 1 0 1 1];

r = [1 0 1 1 0 1 1];

%Shift til højre
%rSh = circshift(r,[-1 1]);

% n = 7;
% k = 4;
% 
% 
% [parmat,genmat,h] = cyclgen(n,g,'system');
% 
% syndrome = mod(rSh*parmat',2)
[feedback, outcome] = SyndromDetector(v, g)