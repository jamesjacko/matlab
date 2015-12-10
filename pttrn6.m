close all
clear all
clc

r = @(k, len) randn(len,1) + k;

a = [r(0,300) r(1,300)]; b = [r(1,300) r(-1,300)]; c = [r(-1,300) r(5,300)];

figure
hold on

plot(a(:,1), a(:,2), 'k.', 'MarkerSize', 10)
plot(b(:,1), b(:,2), 'r.', 'MarkerSize', 10)
plot(c(:,1), c(:,2), 'b.', 'MarkerSize', 10)

axis equal
grid on

header = sprintf('%s\n%s\n%s\n%s\n%s', '@RELATION wekaFile', ...
    '@ATTRIBUTE x1 NUMERIC', ...
    '@ATTRIBUTE x2 NUMERIC', ...
    '@ATTRIBUTE class {1,2,3}', ...
    '@DATA');

% diary MyWekaFile.arff
% 
%     disp(header)
%     for i = 1 : 300
%         fprintf('%.4f %.4f %s\n', a(i, 1), a(i, 2), '1');
%         fprintf('%.4f %.4f %s\n', b(i, 1), b(i, 2), '2');
%         fprintf('%.4f %.4f %s\n', c(i, 1), c(i, 2), '3');
%     end
% 
% diary off


