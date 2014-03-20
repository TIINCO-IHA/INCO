function test = miniproject(t_errors, errorloc)
% function test = miniproject(t_errors, errorloc)
% t_errors:       Number of errors to be introduced. Maximum 2. Default 2.
% errorloc:       Location of the t_errors errors. Should be a vector with
%                 scalars between 1-15 corresponding to bit location 1-15 (degree 0-14).
% test:           Returns one if the decoded message, c, is equal to the input
%                 message, r.
% This code makes use of the cyclic encoder and the Meggitt decoder
addpath('../Encoder');
addpath('../Meggitt');

% Set the code length, message length and the generator polynomial
n = 15;
k = 7;
g = [1 0 0 0 1 0 1 1 1];   % g(x) = 1+X^4+X^6+X^7+X^8

% Generate a message vector by using random numbers in GF(2)
m = mod(randi(2,1,k),2);

% Encode the message vector by the cyclic code encoder function
c = cyclicEncoding(g,m,n,k);

% Transmit the code vector through an artificial communication channel,
% i.e. introduce at least one error to the code vector:

% If the number of errors stated to be introduced is zero, introduce 2 errors
% If no error location has been stated, generate random error locations
% State the error locations in a sorted array
if(nargin < 1)  % no input parameter stating number of errors
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

% If there are two or more errors and they happen to be in the same 
% location then generate two new error locations
while(t > 2 && length(unique(errorlocation)) ~= t)
    errorlocation = sort(randi(n,1,t));
    disp('Errorlocation was recalculated!');
end

% Put the code vector c into the received vector r
r = c;

% Introduce errors at the generated error location(s) i the received vector
% by adding 1 and modulo 2 for binary addition (flipping the bits)
r(errorlocation) = mod(c(errorlocation)+1,2);

% Decode the received vector by the Meggitt decoder
[e, r_c, tag] = meggitt_decoder(r, g, n, k);

% Print whether the decoding was successfull 
if(isequal(c, r_c) == 0)
    disp('The codeword was not decoded correct');
else
    disp('The codeword was successfully decoded');
end
c_t = mat2str(c);     % code vector
r_t = mat2str(r);     % received vector
e_t = mat2str(e);     % error vector
rc_t = mat2str(r_c);  % corrected vector
t_out = 'The coded vector is    c = %s.\nAfter transmission is  r = %s.\nThe error vector is    e = %s.\nThe corrected vector r_c = %s\nThe tag from the decoder claims: %s.\n';
fprintf(t_out,c_t,r_t,e_t,rc_t,tag);

% Verify that the result of the decoding is equal to the code vector
save variables
test = isequal(c, r_c);