close all
clear all
clc
% create dataset
Z = randn(100,2);
% label according to random linear function
l = Z(:,1) > 0;

% Get the weights
w = perceptron(Z,l,0.1);
w = perceptron(Z,l,0.8);