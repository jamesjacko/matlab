close all
clear all
clc

w = [2 2 -1.5; -3 2 1; 2 -1 1];
p = [1 2; -1 5];

MLP221(w,p)

[x,y] = meshgrid(-1:0.05:1, -1:0.05:1);

lbs = MLP221(w, [x(:) y(:)]);
figure
hold on
plot(x(lbs),y(lbs), 'r.', 'markersize', 20)
plot(x(~lbs),y(~lbs), 'b.', 'markersize', 20)
grid on
axis equal