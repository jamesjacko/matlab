[~,pc] = pca(D38_clean);
figure, hold on, axis square
plot(pc(l==3,1), pc(l==3,2), 'k.', 'markersize', 20);
plot(pc(l==8,1), pc(l==8,2), 'r.', 'markersize', 20);
legend('Digit 3', 'Digit 8');
