function res = Meggitt(r)

syndrome = InitSyndrome(r);
buffer = r;
L = length(r(1,:));

error = zeros(1, L);

for i = 1:L
   [error(1,i), syndrome] = Detector(0, syndrome); 

   output = mod(buffer(1,L) + error(1,i),2);

   buffer = circshift(buffer,[-1 1]);
   buffer(1,1) = output;   
end

res = buffer;
end