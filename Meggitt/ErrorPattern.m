function [errorPattern, syndromeTable] = ErrorPattern(rVector, g)
% find tabel, der indeholder syndromer, der matcher de errorpatterns, der
% findes, hvis man kan detektere 2 fejl
L = size(rVector,2);    % her vil den altid være n = 15
n = size(rVector,2);

% Allocate zeros (1+2+...+L+1)
sum = 0;
for i = 1:L
    sum = sum + i;
end
sum = sum +1;   % 121 wtf

flipped = zeros(sum, L);
% Maiken går amok
errorpattern = fliplr(eye(n));
errorpattern(:,n) = 1;
% received vector (uden fejl) lægges til vores oprettede errorpattern
% repmat gentager rVector i L (15) rækker, så den kan lægges sammen med
% errorpattern
errorpattern = mod(repmat(rVector, n, 1)+errorpattern,2);

% Nu skal der laves syndromer til alle errorpatterns (15 stk her)
% s(X) = r(X) mod g(X)
k = 7;
syndromes_errorpattern = zeros(n, n-k);
for i = 1:L
   [q, s] = gfdeconv(errorpattern(i,:),g,2);
%    s
   syndromes_errorpattern(i,:) = [s zeros(1, n-k-length(s))];
end

errorPattern = errorpattern;
syndromeTable = syndromes_errorpattern;

% save syn syndromes_errorpattern
% Så er Maiken færdig med at gå amok


% % Create 1 error
% % for i = 1:L
% %     flipped(i,:) = rVector;
% %     flipped(i,L-i+1) = mod(flipped(i, L-i+1)+1,2);
% % end
% 
% counter = L+1;
% % Create 2 errors
% for k = 2:L+1 %Rows to dublicate
%     error = L-k+1; %Index for error
%     for i = 1:L-k+1 %Row count to create errors in
%         flipped(counter,:) = flipped(k-1,:);
%         flipped(counter,error) = mod(flipped(i, error)+1,2);
%         error = error-1;
%         counter = counter+1;
%     end
% end
% 
% flipped = [rVector ; flipped(1:end-1, :)];
% errorPattern = flipped;
% 
% [parmat,~,~] = cyclgen(size(rVector,2),g,'system');
% pT = parmat';
% 
% syndromeTable = mod(flipped * pT,2);
% % 
% % syndrome = zeros(sum,n-k);
% % for i = 1:sum
% %     [q, p] = gfdeconv(flipped(i,:),pol,2);
% %     while length(p(1,:)) ~= n-k
% %        p = [p 0]; 
% %     end
% %     syndrome(i,:) = p;
% % end
% % 
% % syndromeTable = syndrome;
% end
