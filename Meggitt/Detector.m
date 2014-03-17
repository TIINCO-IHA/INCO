function [error, syndromeOut] = Detector(r, syndromeIn)
%r = r(x) bit
%syndromeIn

    %Detect error
    error = TriAnd(syndromeIn(1,1), syndromeIn(1,2), syndromeIn(1,3));

    %Shift currentinput and syndrome 1 rot he right
    syndrome = circshift(syndromeIn,[-1 1]);

    %Save last syndrome
    lastSyndrome = syndrome(1,1);

    %Modulo 2 on error, last syndrome output and the input vector bit
    newSyndromeValue = mod(error + lastSyndrome + r, 2); 
    
    %Replace first syndrome bit with the calculated syndrom value
    syndrome(1,1) = newSyndromeValue;

    %Modulo 2 on the last syndrom and the second for the new sydrome's 
    %second bit
    syndrome(1,2) = mod(syndrome(1,2) + lastSyndrome, 2);

    %Returnt he calculated syndrome
    syndromeOut = syndrome;
end