function [syndrome] = InitSyndrome(r)
%Initialize the syndrome vector
%Input the vector, r
%Returns the syndrome vector

    L = length(r(1,:));
    syndrome = [0 0 0];
    for i = 1:L
       [~, syndrome] = Detector(r(1,L+1-i), syndrome); 
    end
end