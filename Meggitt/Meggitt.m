function [errorVec, codeVec, tag]  = Meggitt(r, pol, n, k)
%Meggitt decoder
%Decodes an input vector, r, for up to 2 errors
%Returns a corrected output vector, if no more than 2 errors has oocured. 

errorVectors = ErrorPattern(pol, r, n, k);
if n == 15
    s = [0 1 1 1 0 1 1 0 0 1 0 1 0 0 1];
    errorVectors = ErrorPattern(pol, s, n, k);
end

%Find syndrom for the input vector
syndrome = InitSyndrome(r, n-k);

%Store the input in a buffer
buffer = r;

%Calculate the length of the input
L = length(r(1,:));

%Allocate memory for an error vector
error = zeros(1, L);

%For every bit in the input vector
for i = 1:L
    %Detect any errors from the syndrom and return if error and the next
    %syndrome
   [error(1,i), syndrome] = Detector(0, syndrome, errorVectors); 

   %syndrome
   %error
   %Modulo 2 of buffer and error value
   output = mod(buffer(1,L) + error(1,i),2);

   %Shift all bits 1 to the right
   buffer = circshift(buffer,[-1 1]);

   %Set last bit to the output
   buffer(1,1) = output;   
end
error
%Return the buffer as output
codeVec = buffer;
errorVec = r;
tag = 0; % to indicate if if it is decodable, or undecodable but detectable.

end