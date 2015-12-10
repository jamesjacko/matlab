close all
clear all
clc

% 3 A

load('Example_MNIST_digits.mat');
D38 = b(labb==4 | labb==9, :);
% we are interested in 3 and 8 so minus one off labels to make for
% clearer code
l = labb(labb==4 | labb==9) - 1;

% 3 B

% we are doing 1 dimensional distance so only need the absolute 
% distance between the means
d = abs(mean(D38(l==3,:))-mean(D38(l==8,:)));
% sort in descending order
[J, i] = sort(d,'descend');
fprintf('Feature\t\tJ\n===\t\t===\n');
fprintf('%i\t\t%.2f \n', [i(1: 10)' J(1: 10)']' );

%% 3 C
figure, hold on, axis square off, colormap jet
imagesc(reshape(d,28,28));

%% 3 D

badF = sum(d==0)
figure
plot(fliplr(J), '-', 'linewidth', 5);
D38_clean = D38(:, d~=0);

%% 3 E
[~,pc] = pca(D38_clean);
figure, hold on, axis square
plot(pc(l==3,1), pc(l==3,2), 'k.', 'markersize', 20);
plot(pc(l==8,1), pc(l==8,2), 'r.', 'markersize', 20);
legend('Digit 3', 'Digit 8');


%% 3 F
ind = i(1: 8);
rE1 = 1 - mean(l == MyNMC(D38(:, ind), l, D38(:, ind)))
rE2 = 1 - mean(l == MyNMC(pc(:, 1:8), l, pc(:, 1:8)))
