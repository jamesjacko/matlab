close all
clear all
clc

r = @(k) randn(30, 1) + k;

a = [r(0) r(1)]; b = [r(1) r(-1)]; c = [r(0) r(5)];

figure
hold on

plot(a(:,1), a(:,2), 'k.', 'MarkerSize', 10)
plot(b(:,1), b(:,2), 'r.', 'MarkerSize', 10)

axis equal
grid on

set(gca, 'FontSize', 18);
d = [a;b];
Z = linkage(d, 'centroid');
c = cluster(Z, 'maxclust', 2);

plot(d(c==1,1), d(c==1,2), 'mo', 'MarkerSize', 10)
plot(d(c==2,1), d(c==2,2), 'bo', 'MarkerSize', 10)