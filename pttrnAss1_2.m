close all
clear all
clc

load('Example_MNIST_digits.mat');
% create D and Z variables
D = zeros(size(b));
Z = zeros(size(b,1), 2);
% 1 to number of rows in b
for i = 1:size(b, 1)
   % apply treshold
   D(i, :) = (b(i, :) <= 120);
   % transform each row into a 28X28 matrix
   c = reshape(D(i, :), 28, 28);
   % find all values in c that are 0
   [row, col] = find(~c);
   % find aspect ratio
   Z(i, 1) = (max(row)-min(row))/ ...
        (max(col)-min(col));
   % find proportion
   Z(i, 2) = numel(row)/numel(D(i, :));
end
