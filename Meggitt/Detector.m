function [error, syndromeOut] = Detector(r, syndromeIn)
%r = r(x) bit
%syndromeIn

%Detect error
error = TriAnd(syndromeIn(1,1), syndromeIn(1,2), syndromeIn(1,3));

%Shift currentinput and syndrome 1 rot he right
syndrome = circshift(syndromeIn,[-1 1]);

%Save last syndrome
lastSyndrome = syndrome(1,1);

newSyndromeValue = mod(error + lastSyndrome + r, 2); 
syndrome(1,1) = newSyndromeValue;

syndrome(1,2) = mod(syndrome(1,2) + lastSyndrome, 2);

syndromeOut = syndrome;
end