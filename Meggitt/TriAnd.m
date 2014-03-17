function res = TriAnd(a, b, c)
%And gate with second input inverted
%Only input [1 0 1] will return 1

    if( a == 1 && b == 0 && c == 1)
        res = 1;
    else
        res = 0;
    end
end