function [feedback, outcome] = SyndromDetector(syndromInput, Gx, shift)
%Error Pattern Detection Circuit
%syndromInput - Receive input r(x)
%shift - Only insert when syndromInput has been loaded to shift

n = length(syndromInput(1,:));

vector = 0; %Reset vector
switch nargin %More than one input?
    case 2 %Load vecotr
        vector = syndromInput;
    case 3 %Shift vector
        vector = circshift(syndromInput,[-1 1]);
    otherwise %Too many arguments!
        error('Too many arguments!')
end

%Create parity check matrix in systematic form
[parmat,genmat,h] = cyclgen(n, Gx, 'system');

%Find syndrom vector with parity check matrix 
syndrome = mod(vector*parmat',2);

%Run syndrom vector through Nandgate (with second bit flipped)
outcome = TriAnd(syndrome(1,1), syndrome(1,2), syndrome(1,3));

%Return the feedback
feedback = syndrom(1,3);

end