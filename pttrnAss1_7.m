close all
clear all
clc

load('Example_MNIST_digits.mat');
% create variable to hold all assigned labels in bagging
assignedLabs = zeros(5000,9);
for i = 1 : 9
    % Build an index of 5000 values with repitition 
    % in the range 1 to length of dataset
    ind = randi(size(b, 1), size(b, 1), 1);
    % pass the indexed dataset to the MyNMC function
    % as well as the full dataset for testing
    assignedLabs(:,i) = MyNMC(b(ind, :), labb(ind), b);
end
% Get the assigned label by selecting the most assigned
% label from the output for each value
alabb = mode(assignedLabs,2);
% calculate the accuracy of the classifier ensemble
acc = mean(alabb == labb);

% construct the confusion matrix
c = zeros(10);
% loop over the rows in the 
for i = 1 : size(alabb, 1);
  % increment the value at the posiition representing where the
  % assigned label is
  c(labb(i),alabb(i)) = c(labb(i),alabb(i)) + 1;
end

% used to test accuracy of confusion matrix
% con = confusionmat(labb, avgLabs);
% mean(c(:)==con(:))

% run single nmc on the data and output the accuracy
snmc = MyNMC(b,labb,b);
snmcAcc = mean(snmc==labb)
