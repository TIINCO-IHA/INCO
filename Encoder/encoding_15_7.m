function c = encoding_15_7(g,m)
n = 15;
k = 7;
shifted_m = [zeros(1,n-k) m];
[q, p] = gfdeconv(shifted_m,g,2);
% c = shifted_m+p, men de skal være samme længde
% c er n lang, shifted_m er n lang, p er forskellig længde alt efter den
% indkomne besked (message).
% zeropad p til n længde, så additionen kan gennemføres hver gang.

p = [p zeros(1, n-length(p))];

c= mod(shifted_m+p,2);