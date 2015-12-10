close all
clear all
clc


Z = rand(500, 3);
M = 10;
W = SOM(Z, [M M], 100, 0.9, 0.99);

r = reshape(uint8(W(:,1) * 255), M, M);
g = reshape(uint8(W(:,2) * 255), M, M);
b = reshape(uint8(W(:,3) * 255), M, M);

imshow(cat(3,r,g,b), 'initialmagnification', 'fit');
