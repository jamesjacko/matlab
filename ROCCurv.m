data = [0.25 0.29 0.62 0.27 0.82 1.18 0.93 0.54 0.78 0.31 1.11 1.08 1.02];
labels = [1 1 1 1 1 2 2 2 2 2 2 2 2];

dataset = [data' labels'];

dataset = sortrows(dataset,1);

hold on

for i = 1:numel(data)
    left = dataset(1:i,:);
    right = dataset(i+1:end,:);
    tps = sum(right(:,2) == 2);
    tns = sum(left(:,2) == 1);
    fps = sum(right(:,2) == 1);
    fns = sum(left(:,2) == 2);
    sensitivity = tps / (tps + fps);
    specificity = tns / (tns + fns);
    plot(specificity, 1 - sensitivity, 'x-');
end