close all
clear all
clc

% figure('color', 'w'), hold on, grid on, axis square
% x = rand(10000,1) * 10; y = rand(10000,1) * 10;
% 
% ind = (x <= 8 & x >= 3) & (y <= 4 & y >= 1);
% 
% %plot(x(ind), y(ind), 'k.', 'markers', 10);
% %plot(x(~ind), y(~ind), 'g.', 'markers', 10);
% 
% figure('color', 'w'), hold on, grid on, axis square
% x = rand(10000,1) * 10; y = rand(10000,1) * 10;
% c1 = 3;
% c2 = 8;
% radius = 2;
% 
% 
% ind = sqrt((x - c1).^2 + (y - c2).^2) < radius;
% 
% %plot(x(ind), y(ind), 'k.', 'markers', 10)
% %plot(x(~ind), y(~ind), 'g.', 'markers', 10)
% 
% 
% figure('color', 'w'), hold on, grid on, axis square
% x = rand(10000,1) * 10; y = rand(10000,1) * 10;
% c = [5 4];
% radius = 1;
% r = [5 9; 8 1];
% l = [5 9; 2 1];
% b = [2 1; 8 1];
% 
% 
% 
% resultr = (x - r(1,1)) * (r(2,2) - r(1, 2)) - (r(2, 1) - r(1, 1)) * (y - r(1, 2));
% resultl = (x - l(1,1)) * (l(2,2) - l(1, 2)) - (l(2, 1) - l(1, 1)) * (y - l(1, 2));
% resultb = (x - b(1,1)) * (b(2,2) - b(1, 2)) - (b(2, 1) - b(1, 1)) * (y - b(1, 2));
% 
% ind = (resultl < 0) & (resultb < 0) & (resultr > 0) & ~(sqrt((x - c(1)).^2 + (y - c(2)).^2) < radius);
% 
% plot(x(ind), y(ind), 'k.', 'markers', 10)
% plot(x(~ind), y(~ind), 'g.', 'markers', 10)
% x = [0 15 30]
% y = [0 3 0]
% plot(x,y, 'b.-')
% grid on
% x = [1 : 20];
% y = repmat([0 1], 1, 10);
% plot(x,y, 'b.-')
% grid on
x = [1 : 20;11: 30];
x = x(:);
y = 1:40;
figure('color', 'w');
hold on
plot(x,y, 'b.-', 'LineWidth', 2, 'MarkerSize', 20)
axis([0 40 0 40])
grid on

