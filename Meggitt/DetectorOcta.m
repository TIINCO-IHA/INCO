function [error, syndromeOut] = DetectorOcta(r, syndromeIn, init)
%r = r(x) bit
%syndromeIn

    %Detect error
    error = TriAnd(syndromeIn(1,1), syndromeIn(1,2), syndromeIn(1,3));

    %Shift currentinput and syndrome 1 rot he right
    syndrome = circshift(syndromeIn,[-1 1]);

    %Save last syndrome
    lastSyndrome = syndrome(1,1);

    if nargin == 2
        %Modulo 2 on error, last syndrome output and the input vector bit
        newSyndromeValue = mod(error + lastSyndrome, 2); 
    elseif nargin == 3
        newSyndromeValue = mod(lastSyndrome + r, 2); 
    else
        error('Wrong number of argument input')
    end
    
    %Replace first syndrome bit with the calculated syndrom value
    syndrome(1,1) = newSyndromeValue;

    %Modulo 2 on the last syndrom and the second for the new sydrome's 
    %second bit
    syndrome(1,2) = mod(syndrome(1,2) + lastSyndrome, 2);

    %Returnt he calculated syndrome
    syndromeOut = syndrome;
end