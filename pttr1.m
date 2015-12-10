close all
clear all
clc

%a

mean(abs(randn(10^5,1))<1)


sampleSize = 10000;
%b
sample1 = randn(sampleSize, 1);
sample2 = randn(sampleSize, 1);
% axis square
% plot(sample1, sample2, '.') 


%c
sample1 = randn(sampleSize, 1);
sample2 = randn(sampleSize, 1);
sample3 = randn(sampleSize, 1);
% axis square
% plot3(sample1, sample2, sample3, '.')
% rotate3d



%d
sample1 = randn(sampleSize, 1);
sample2 = randn(sampleSize, 1);
ind = sample1 > 0;
% hold on
% plot(sample1(ind), sample2(ind), 'b.')
% plot(sample1(~ind), sample2(~ind), 'r+')

%e

hold on

% plot(sample1+10, sample2+10, 'm.')
% plot(sample1-10, sample2-10, 'c.')
% plot((sample1*0.1) + 20, (sample2), 'r.')
% plot((sample1*0.3) + 10, (sample2), 'g+')
% plot(sample1, (sample2*1.2) + 20, 'b+')
% plot(sample1, (sample2*4) - 10, 'k+')
% plot(sample1, sample2, 'y.')
% plot(sample1-15, sample2+15, 'ro')



% task 2 a

close all, clear all, clc
load('Example_MNIST_digits.mat');
i = randi(size(b,1));
m = reshape(b(i,:), 28, 28);
imshow(uint8(m'), 'initialmagnification', 'fit');

%task 2 b

close all, clear all, clc
load('Example_MNIST_digits.mat');
i = randi(size(b,1));
m = reshape(b(i,:), 28, 28);
imshow(m'<120, 'initialmagnification', 'fit');

% task 2 c

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
hold on
plot(r(labb == 1), a(labb == 1), 'r.');
plot(r(labb == 2), a(labb == 2), 'gx');
legend('Digit 0', 'Digit 1');


labels = [];
a = min(bsxfun(@minus,[1 0; 1 2; 1 9],[1 0]));














[~,c] = cellfun(@(x) min(bsxfun(@sum, bsxfun(@minus, x, m)).^2, 2), num2cell(x));