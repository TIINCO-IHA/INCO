% test af papirøvelse
clear all, close all, clc;

g = [1 0 0 0 1 0 1 1 1];
c = [0 1 1 1 1 0 0 0 1 0 0 1 1 0 1];

r = c;
r(7) = 1;

[q, iSyn] = gfdeconv(r,g,2);

r1 = circshift(r, [1 1]);
[q, s1] = gfdeconv(r1,g);

r2 = circshift(r1, [1 1]);
[q, s2] = gfdeconv(r2,g);

r3 = circshift(r2, [1 1]);
[q, s3] = gfdeconv(r3,g);

r4 = circshift(r3, [1 1]);
[q, s4] = gfdeconv(r4,g);

r5 = circshift(r4, [1 1]);
[q, s5] = gfdeconv(r5,g);

r6 = circshift(r5, [1 1]);
[q, s6] = gfdeconv(r6,g);

r7 = circshift(r6, [1 1]);
[q, s7] = gfdeconv(r7,g);

r8 = circshift(r7, [1 1]);
[q, s8] = gfdeconv(r8,g);

r9 = circshift(r8, [1 1]);
[q, s9] = gfdeconv(r9,g);

%% Test med eksempel fra papirerne
clear all
g = [1 1 0 1];

v = [1 0 0 1 0 1 1]; r = [1 0 1 1 0 1 1];

[q, iSyn] = gfdeconv(r,g,2);

r1 = circshift(r, [1 1]);

[q, s1] = gfdeconv(r1, g, 2);

r2 = circshift(r1, [1 1]);

[q, s2] = gfdeconv(r2, g, 2);

r3 = circshift(r2, [1 1]);

[q, s3] = gfdeconv(r3, g, 2);

r4 = circshift(r3, [1 1]);

[q, s4] = gfdeconv(r4, g, 2);

r5 = circshift(r4, [1 1]);

[q, s5] = gfdeconv(r5, g, 2);

