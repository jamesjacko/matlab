close all
clear all
clc

a = randn(300,2);
b = randn(300,2) + 2;
c = randn(300,2) - 2;

figure

subplot(1,2,1)
hold on
plot(a(:,1), a(:,2), 'k.');
plot(b(:,1), b(:,2), 'ks');
plot(c(:,1), c(:,2), 'ko');

ds = [a; b; c];

ind = kmeans(ds, 3);

plot(ds(ind == 1 ,1), ds(ind == 1 ,2), 'ro', 'markersize', 7);
plot(ds(ind == 2 ,1), ds(ind == 2 ,2), 'go', 'markersize', 7);
plot(ds(ind == 3 ,1), ds(ind == 3 ,2), 'bo', 'markersize', 7);

axis equal

Z = linkage(ds, 'single');

cl = cluster(Z, 'maxclust', 3);

subplot(1,2,2)
hold on
plot(a(:,1), a(:,2), 'k.');
plot(b(:,1), b(:,2), 'ks');
plot(c(:,1), c(:,2), 'ko');

plot(ds(cl == 1 ,1), ds(cl == 1 ,2), 'ro', 'markersize', 7);
plot(ds(cl == 2 ,1), ds(cl == 2 ,2), 'go', 'markersize', 7);
plot(ds(cl == 3 ,1), ds(cl == 3 ,2), 'bo', 'markersize', 7);

axis equal


