function [errorPattern, syndromeTable] = ErrorPattern(rVector, g)

L = size(rVector,2);

% Allocate zeros (1+2+...+L+1)
sum = 0;
for i = 1:L
    sum = sum + i;
end
sum = sum +1;

flipped = zeros(sum, L);

% Create 1 error
for i = 1:L
    flipped(i,:) = rVector;
    flipped(i,L-i+1) = mod(flipped(i, L-i+1)+1,2);
end

counter = L+1;
% Create 2 errors
for k = 2:L+1 %Rows to dublicate
    error = L-k+1; %Index for error
    for i = 1:L-k+1 %Row count to create errors in
        flipped(counter,:) = flipped(k-1,:);
        flipped(counter,error) = mod(flipped(i, error)+1,2);
        error = error-1;
        counter = counter+1;
    end
end

flipped = [rVector ; flipped(1:end-1, :)];
errorPattern = flipped;

[parmat,~,~] = cyclgen(size(rVector,2),g,'system');
pT = parmat';

syndromeTable = mod(flipped * pT,2);
% 
% syndrome = zeros(sum,n-k);
% for i = 1:sum
%     [q, p] = gfdeconv(flipped(i,:),pol,2);
%     while length(p(1,:)) ~= n-k
%        p = [p 0]; 
%     end
%     syndrome(i,:) = p;
% end
% 
% syndromeTable = syndrome;
end
