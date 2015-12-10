close all
clear all
clc

load('Example_MNIST_digits.mat');
D = b <= 120;
Z = zeros(size(b,1), 2);
% 1 to number of rows in b
for i = 1:size(b, 1)
   c = reshape(D(i, :), 28, 28);
   [row, col] = find(~c);
   % find aspect ratio
   Z(i, 1) = (max(row)-min(row))/ ...
        (max(col)-min(col));
   % find proportion
   
end
Z(:,2) = mean(~D, 2);

% part A
% Variable to hold errors
ers = zeros(9,1);
% Loop over 10 digits
for i = 0:9
   % use suplied classifier with the data and save the labels in nl
   nl= classifier(Z, labb == i + 1);
   % count the errors in the new labels
   ers(i + 1) = 1 - sum(nl == (labb == i + 1)) / size(nl,1);
end
figure
% plot the errors for the 10 digits for comparison further down
plot(0:9, ers, 'r-');
xlabel('Digit')
ylabel('Error rate')
print -depsc 3a

% part c
% Variable to hold errors
err = zeros(numel(unique(labb)), 1);
% Loop over 10 digits
for i = 1:10
    % current label(digit) is positive (1) everything else is negative(0)
    labba = labb == i;
    % lables array
    labels = zeros(size(Z,1),1);
    %loop over all data in Z
    for j = 1 : size(Z,1)
       % assign label for the left out element
       labels(j) = MyNMC(Z([1:j, j+1:end], :), ...
           labba([1:j, j+1:end]), Z(j, :)); 
    end
    % calculate the error rate
    err(i) = mean(labels ~= labba);
end
% plot the error rate for comparison
figure
plot(0:9, err, 'b-');
xlabel('Digit')
ylabel('Error rate')
print -depsc 3c
