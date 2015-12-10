close all
clear all
clc

% lazy copy and paste from pdf
d = [0.84 0.55 0.08 -0.64;
0.49 0.61 0.70 0.51;
0.67 0.25 0.59 1.06;
0.92 0.50 0.18 0.51;
0.94 0.66 0.30 -0.35;
0.22 0.85 0.70 -1.49;
0.21 0.78 0.84 1.53;
0.81 0.92 0.44 -0.50;
0.10 0.44 0.07 0.58;
0.21 0.70 0.41 1.89;]';

% assign more meaningful variables to work with
c = d(1:2,:)';
s = d(3,:)';
w = d(4,:)';
b = 0.28;
N = 1000;
[x, y] = meshgrid(linspace(0,1,N));
% get all points as x y columns
ps = [x(:) y(:)];
n = zeros(size(ps,1),1);
for p = 1: size(ps,1)
   % apply the rbf formula
   % repeat the current point to a matrix the size of c
   % minus c from the new point matrix
   % elementwise square the result
   % sum each square length along the second dimension
   % devide each length by its counterpart in the 2 * squared sigma matrix
   % get the exponent
   node = exp(-sum((repmat(ps(p,:), size(c,1), 1) - c).^2,2) ./ (2*s.^2));
   % add all of the results together and add the bias. (bias should
   % strictly be 1* b)
   n(p) = sum(node .* w) + b;
end
% ij reverses the y axis so the image is plotted in image space
% rather than standard x and y space
figure, hold on, axis ij square off, colormap jet
imagesc(reshape(n, N, N));
%%
figure
colormap jet
surf(reshape(n, N, N), 'EdgeColor','none','LineStyle','none','FaceLighting','phong')
rotate3d