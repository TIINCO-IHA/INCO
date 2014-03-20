function syndromes_errorpattern = generateErrorPattern(g,n,k)
% generate syndrome error pattern

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
