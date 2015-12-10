close all;
clear all;
clc;

% x = -5:0.05:5;
% 
% 
% 
% g = zeros(3, size(x,2));
% g(1,:) = 2.*x + 12;
% g(2,:) = (x - 4).^2;
% g(3,:) = x.^3 - 2.*x + 2;
% 
% [~,c] = max(g, [], 1);
% hold on;
% plot(x(c==1), 0, 'r.');
% plot(x(c==2), 0, 'g.');
% plot(x(c==3), 0, 'b.');
% inc = 0.05;
% nums = -20:inc:20;
% 
% [x,y] = meshgrid(nums, nums);
% 
% g = zeros(size(x,1), size(x,2), 2);
% 
% g(:,:,1) = -3 * x + 5 * y;
% 
% % 
% g(:,:,2) = x .* (y .^ 2) + (-4 .* x .^ 2) + 3;
% 
% [~,c] = max(g, [], 3);
% hold on
% plot(x(c==1), y(c==1), 'k.');
% plot(x(c==2), y(c==2), 'r.');
% 
% 
% 
% plot(x(:,~,c == 1), y(c == 1), 'k.');
% plot(x(c == 2), y(c == 2), 'k.');

close all, clear all, clc
load('Example_MNIST_digits.mat');
r = mean(b'>120,1);
a = zeros(size(r));
% 1 to number of rows in b
for i = 1:size(b, 1)
    % extract row i from b and create 28*28 matrix
    c = reshape(b(i, :), 28, 28);
    % get every value of indexes of c that is not 0
    [row, col] = find(c);
    % calculate the aspect ratio
    a(i) = (max(row)-min(row))/ ...
        (max(col)-min(col));
end

% Task 2 d


classes = [1,3,4,5,6,7,8,9,10];
for i = 1:9
    subplot(3,3,i)
    hold on
    title(classes(i)-1);
    plot(r(labb == 2), a(labb == 2), 'k.');
    plot(r(labb == classes(i)), a(labb == classes(i)), '.', 'Color', rand(3,1));

end