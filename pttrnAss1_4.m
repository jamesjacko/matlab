close all
clear all
clc

load('Example_MNIST_digits.mat');
D = b <= 120;


% part a

ers = zeros(9,1);
for i = 1:10
   nl= classifier(b, labb == i);
   ers(i) = 1 - sum(nl == (labb == i)) / size(nl,1);
end

ers2 = zeros(9,1);
for i = 0:9
   nl= classifier(double(D), labb == i + 1);
   ers2(i + 1) = 1 - sum(nl == (labb == i + 1)) / size(nl,1);
end

figure
hold on
% plot the error rates for both classifier with Original Data and D
plot(0:9, ers, 'r-');
plot(0:9, ers2, 'b-');
xlabel('Digit')
ylabel('Error rate')
print -depsc plot4
