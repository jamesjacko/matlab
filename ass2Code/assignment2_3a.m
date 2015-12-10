close all
clear all
clc

load('Example_MNIST_digits.mat');
D38 = b(labb==4 | labb==9, :);
% we are interested in 3 and 8 so minus one off labels to make for
% clearer code
l = labb(labb==4 | labb==9) - 1;
