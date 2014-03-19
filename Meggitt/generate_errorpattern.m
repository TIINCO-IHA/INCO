% generate syndrome error pattern
n = 15;
k = 7;
g = [1 0 0 0 1 0 1 1 1];

errorpattern = fliplr(eye(n));
errorpattern(:,n) = 1;
syndromes_errorpattern = zeros(n,n-k);

for i = 1:n
    [q, s] = gfdeconv(errorpattern(i,:), g, 2);
    if(length(s) ~= n-k)
        syndromes_errorpattern(i,:) = [s zeros(1,n-k-length(s))];
    else
        syndromes_errorpattern(i,:) = s;
    end
end

save syndrome syndromes_errorpattern
