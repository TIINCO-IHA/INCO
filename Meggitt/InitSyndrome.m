function [syndrome] = InitSyndrome(r)
%r = r(x)

L = length(r(1,:));
syndrome = [0 0 0];
for i = 1:L
   [error, syndrome] = Detector(r(1,L+1-i), syndrome); 
end

end