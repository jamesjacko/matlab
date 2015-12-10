a = randn(100,2);
b = a + 6;

labs = [zeros(100,1); ones(100,1)];


weights = perceptron([a b], labs)