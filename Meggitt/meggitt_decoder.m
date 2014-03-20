function [error_vec, code_vec, tag] = meggitt_decoder(r, g, n, k)
% function [error_vec, code_vec, tag] = meggitt_decoder(r, g, n, k)
% Decodes and corrects t errors in the received vector, r, from the generator polynomial, g.
% Input:
% r             is the received vector (maybe with errors)
% g             is the generator polynomial written in vector form,
%               e.g. [1 0 1 1] for g(X) = 1 + X^2 + X^3
% n             is the lenght of the received vector
% k             is the length of the message in the received vector

% Output:
% error_vec     is the error vector, e(X)
% code_vec      is the corrected received vector, r'(X)
% tag           is a string which indicate how the decoded went


% Generate syndrome error pattern from
% the generator polynomial g(X) = 1+X^4+X^6+X^7+X^8. The table is af 15x8
% matrix called syndromes_errorpattern.
syndromes_errorpattern = generateErrorPattern(g,n,k);

% Initialize error vector
error_vec = zeros(1,n);

% si is set to the init syndrome, which is assumed to be of length n-k
% The init syndrome is obtained via shifting the received message into the
% circuit (n=15 shifts)
si = init_Syndrome(r,g,n,k);
if sum(si)==0
    disp('The received vector is error free');
    code_vec = r;
    return
end


for i = 1:n
    % Test of syndrome is equal to one of the error syndromes
    for b = 1:n
        % Check if the calculated syndrome is equal to one of the rows in syndrome
        % table
        if(isequal(si, syndromes_errorpattern(b,:))==1)
            % correct bit, if error happened
            error_vec(i) = 1;
            r(end) = mod(r(end)+1,2);
        end
    end
    
    % Right shift the received vector 1 bit
    ri = circshift(r, [1 1]);
    % Calculate new syndrome register
    [q, si] = gfdeconv(ri,g,2);
    % Set r to ri (make the shift in memory too)
    r = ri;
    % zeropad si to compare with the syndrome table
    if(length(si) ~= n-k)
        si = [si zeros(1,n-k-length(si))];
    end
end

if sum(si)~=0 && sum(error_vec) > 2
    tag = 'The received vector contains more than 2 errors';
elseif sum(si)==0 && sum(error_vec) <= 2 && sum(error_vec) >= 1
    tag = ['The decoder has corrected ', num2str(sum(error_vec)), ' error(s)'];
else
    tag = 'The received vector contains more than 2 errors';
end

error_vec = fliplr(error_vec);
code_vec = r;
