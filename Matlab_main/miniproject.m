function test = miniproject(t_errors, errorloc)
% function test = miniproject(t_errors, errorloc)
% t_errors:       Number of errors to be introduced. Maximum 2. Default 2.
% errorloc:       Location of the t_errors errors. Should be a vector with
%                 scalars between 1-15 corresponding to bit location 1-15 (degree 0-14).
% test:           Returns zero if the decoded message is equal to the input
%                 message.
addpath('../Encoder');
addpath('../Meggitt');

% Generate message vector
n = 15;
k = 7;
g = [1 0 0 0 1 0 1 1 1];

if(nargin < 1)  % no input parameters
    t = 2;
    errorlocation = sort(randi(n,1,t));
elseif(nargin > 0)
    t = t_errors;
    if(nargin < 2)
        errorlocation = sort(randi(n,1,t));
    else
        errorlocation = sort(errorloc);
    end
end

% generate random numbers in GF(2)
m = mod(randi(2,1,k),2);

% Encode message vector by the ciclic code encoder
c = cyclicEncoding(g,m,n,k);

while(t > 2 && length(unique(errorlocation)) ~= t)
    errorlocation = sort(randi(n,1,t));
    disp('Errorlocation was recalculated!');
end
r = c;

% Flip bit at generated error location i the received vector.
% Add 1 and modulo 2 for binary addition
r(errorlocation) = mod(c(errorlocation)+1,2);

% Decode the received vector by the meggitt decoder

[e, r_c, tag] = meggitt_decoder(r, g, n, k);

c_t = mat2str(c);
e_t = mat2str(e);
r_t = mat2str(r);
rc_t = mat2str(r_c);
t_out = 'The coded vector is    c = %s.\nAfter transmission is  r = %s.\nThe error vector is    e = %s.\nThe corrected vector r_c = %s\nThe tag from the decoder claims: %s.\n';
fprintf(t_out,c_t,r_t,e_t,rc_t,tag);
% clear c_t; clear e_t; clear r_t; clear rc_t; clear t_out;

save variables
test = isequal(c, r_c);