clc, clear

%Meggitt decoder

%v(x)
v = [1 0 0 1 0 1 1];

%r(x) with error
r = [1 0 0 1 0 0 1];

res = Meggitt(r)

isequal(v, r)
