function [syndrome] = InitSyndrome(r, m)
%Initialize the syndrome vector
%Input the vector, r
%Returns the syndrome vector

    L = length(r(1,:));
    syndrome = zeros(1,m);
    syndromeCopy = zeros(L, m);
    for i = 1:L
       [~, syndrome] = Detector(r(1,L+1-i), syndrome); 
       syndromeCopy(i,:) = syndrome;
    end
    
    syndromeCopy
end