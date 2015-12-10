close all
clear all
clc

load('Example_MNIST_digits.mat');
D = b <= 120;
Z = zeros(size(b,1), 2);
Z(:,2) = mean(~D, 2);
% 1 to number of rows in b
for i = 1:size(b, 1)
   c = reshape(D(i, :), 28, 28);
   [row, col] = find(~c);
   % find aspect ratio
   Z(i, 1) = (max(row)-min(row))/ ...
        (max(col)-min(col));
   % find proportion
   
end

labbs = labb == 2;
% Use the MyRoc function to compare the Aspect Ratio
% and Proportion
[rocMatrixAspect, aClosest] = MyRoc(Z(:,1), ~labbs + 1);
[rocMatrixProportion, pClosest] = MyRoc(Z(:,2), ~labbs + 1);
figure
hold on
grid on
axis square
set(gca, 'ytick', 0:0.2:1)
plot(1 - rocMatrixAspect(:,1), rocMatrixAspect(:,2), 'r-');
plot(1 - rocMatrixProportion(:,1), rocMatrixProportion(:,2), 'b-');
xlabel('1-specifictiy')
ylabel('sensitivity')
legend('Aspect Ratio','Proportion Black')
print -depsc plot6