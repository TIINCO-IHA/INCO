function iSyndrome = init_Syndrome(r,g,n,k)
% function iSyndrome = init_Syndrome(r,g)
% 
% 

[q, iSyndrome] = gfdeconv(r,g,2);

if(length(iSyndrome) ~= n-k)
    iSyndrome = [iSyndrome zeros(1,n-k-length(iSyndrome))];
end