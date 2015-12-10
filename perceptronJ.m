function weights = perceptronJ(z, labz)
    weights = randn(1, size(z,2) + 1);
    n = 0.1;
    errors = 1;
    count = 0;
    while errors > 0 && count < 1000
        errors = 0;
        count = count + 1;
        for i = 1 : size(z,1)
           v = sum(weights .* [1 z(i,:)]) < 0;
           if labz(i) ~= v
               weights = weights - ((2* v) - 1) * n * z(i);
               errors = 1;
           end
        end
    end
    if count == 1000
        weights = [];
    end
end