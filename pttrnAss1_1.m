close all
clear all
clc
% load dataset
load('Example_MNIST_digits.mat');
% loop over 10 digits
for i = 1: 10
    % 3/4 subplots
   subplot(3,4,i)
   % Get the average of each digit, convert it 8bit integers,
   % Reshape the row into a matrix and show the resulting image
   imshow(reshape(uint8(mean(b(labb == i, :), 1)), 28, 28)');
   % Show the title for the subplot
   title(i-1)
end