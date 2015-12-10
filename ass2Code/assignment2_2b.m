figure
for i = 2:7
    c = kmeans_cg(Z, i);
    subplot(2, 3, i-1), hold on, axis square off;
    % Draw subplots
    arrayfun(@(a) plot(Z(c==a,1), Z(c==a,2), '.', ...
    'color', rand(1,3), 'markersize', 20), 1:i)
    title(i);
end
