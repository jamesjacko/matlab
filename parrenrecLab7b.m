close all
clear all
clc

load('Example_MNIST_digits.mat');
ul = unique(labb);
means = zeros(size(ul,1), size(b,2));

for j = 1 : size(ul, 1)
   means(j,:) = mean(b(labb==j,:)); 
end

dist = zeros(size(b));
for i = 1 : size(b,1)
   dist(i,:) = sum((repmat(b(i,:), size(means,1), 1) - means).^2);
end

sums = sum(dist);

[~, ind] = max(sums);

disp(ind);

imSums = reshape(sums, 28, 28);

imagesc(imSums');

[~, pc] = pca(b(labb == 2, :));

figure
plot(pc(:,1), pc(:,2), 'k.', 'markersize', 20);

axis equal

[~, mini] = min(pc(:,1))

c = b(labb==2, :);
figure
imshow(uint8(reshape(c(mini,:),28,28)'));

[~, maxi] = max(pc(:,1))
figure
imshow(uint8(reshape(c(maxi,:),28,28)'));
