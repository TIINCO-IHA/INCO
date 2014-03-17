clc, clear
%Meggitt decoder

% g = [1 1 0 1];
% n = 7;
% k = 4;
% 
% v = [1 0 0 1 0 1 1];
% s = [1 0 1 1 0 1 1];
% 
% 
% [errVec, codeVec, tag] = Meggitt(s, g, n, k);
% Equal = isequal(v, codeVec)

pol = [1 0 0 0 1 0 1 1 1];
n = 15;
k = 7;

c = [0 1 1 1 0 1 1 0 0 1 0 1 0 0 0];
r = [0 1 1 1 0 1 1 0 0 1 0 1 0 0 1];
% 
% [errVec, codeVec, tag] = Meggitt(r, pol, n, k);
% Equal = isequal(c, codeVec)
%syndrome = InitSyndrome(t)
