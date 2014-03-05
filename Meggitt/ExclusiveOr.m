function res = ExclusiveOr(a, b)
% Returns and exclusive-or value for the two input bits, a and b

if (a == 1 && b == 0) || (a == 0 && b == 1)
    res = 1;
else
    res = 0;
end

end