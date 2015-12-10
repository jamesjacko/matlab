close all
clear all
clc

% 1 A
N = 10; % used throughout the script
% Generate distinct random points
r = randperm(25);
[x y] = ind2sub([5,5],r(1:N));
z = [x' y'];
figure
hold on
% have to increase marker size as it is
plot(z(:,1), z(:,2), 'k.', 'markersize', 30);
text(z(:,1) + 0.1, z(:,2) + 0.1, num2cell(1:N));
