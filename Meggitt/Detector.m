function [errorVal, syndromeOut] = Detector(r, syndromeIn, errorVectors)
%Will detect up to 2 errors from the errorVectors and the syndromeIn
%r = r(x) bit, only used when initialing has been done
%syndromeIn = the current syndrome.
%errorVectors = Matrix with errorVectors

errorVal = 0;

%If errorVectors are provided it's NOT the initial state.
if nargin == 3
     L = length(errorVectors(:,1));
%     errorPatterns = zeros(L, length(errorVectors(1,:)));
    for i = 1:L
        if isequal(errorVectors(i,:), syndromeIn) == 1
            errorVal = 1;
            i
        end
    end
end

%Shift currentinput and syndrome 1 rot he right
syndrome = circshift(syndromeIn,[-1 1]);

%Save last syndrome
lastSyndrome = syndrome(1,1);

if nargin == 3 %If not init
    %Modulo 2 on error, last syndrome output and the input vector bit
    newSyndromeValue = mod(errorVal + lastSyndrome, 2);
    
elseif nargin == 2 %If init
    newSyndromeValue = mod(lastSyndrome + r, 2); 
    
else
    error('Wrong number of argument input');
end

%Replace first syndrome bit with the calculated syndrom value
syndrome(1,1) = newSyndromeValue;

%Modulo 2 on the last syndrom and the second for the new sydrome's 
%second bit    
[~, loops] = size(syndrome(1,:));
for i = 2:loops-1
    syndrome(1,i) = mod(syndrome(1,i) + lastSyndrome, 2);
end

%Returnt he calculated syndrome
syndromeOut = syndrome;
end