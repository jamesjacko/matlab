% Apply kruscals minimum spanning tree to the dataset and plot
% the clusters on the figure as coloured rings around the data
% values
a = kruskals_mst_with_comments(z, 3);
plot(z(a==1,1), z(a==1,2), 'ro', 'markersize', 10, 'linewidth', 10);
plot(z(a==2,1), z(a==2,2), 'go', 'markersize', 10, 'linewidth', 10);
plot(z(a==3,1), z(a==3,2), 'bo', 'markersize', 10, 'linewidth', 10);
