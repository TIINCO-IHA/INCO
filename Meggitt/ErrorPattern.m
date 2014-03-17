function errorPattern = ErrorPattern(pol, rVector, n, k)


L = length(rVector(1,:));
flipped = zeros(length(rVector(1,:))-1, length(rVector(1,:)));

for i =1:L-1
    flipped(i,:) = rVector;
    flipped(i,L-i) = mod(flipped(i, L-i)+1,2);
end
flipped = [rVector ; flipped];


syndrome = zeros(L,n-k);
for i = 1:L
    [q, p] = gfdeconv(flipped(i,:),pol,2);
    while length(p(1,:)) ~= n-k
       p = [p 0]; 
    end
    syndrome(i,:) = p;
end

errorPattern = syndrome;
%errorPattern
end
