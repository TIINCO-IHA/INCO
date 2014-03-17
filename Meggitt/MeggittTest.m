clc, clear
%Meggitt decoder

r = [0 1 1 1 0 1 1 0 0 1 0 1 0 0 0];
c = [0 1 1 1 0 1 1 0 0 1 0 1 0 0 0];

pol = [1 0 0 0 1 0 1 1 1];
n = 15;
k = 7;

[errVec, codeVec, tag] = Meggitt(r, pol, n, k);
Equal = isequal(c, codeVec)
%syndrome = InitSyndrome(t)