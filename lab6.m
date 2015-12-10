clear all
close all 
clc

% 
% 
a = imread('coins.png');




ind = a < 100;

r = a;
g = a;
b = a;
r(ind) = 0;
b(ind) = 0;
g(ind) = 50;


coins1 = cat(3, r, g, b);
figure, imshow(coins1)

r(~ind) = 255;
g(~ind) = 128;
b(~ind) = 0;
coins2 = cat(3, r, g, b);
figure, imshow(coins2)

r = a;
g = a;
b = a;
r(ind) = 70;
b(ind) = 0;
g(ind) = 0;
coins3 = cat(3, r, g, b);
coinsm = [coins3, coins3];
figure, imshow(coinsm)

sz = size(coins1);
mult = [0.51 0.43 1];
sz .* mult


figure, imshow(coins1(115:177, 65:128, :))

% load mandrill
% ma = ind2rgb(X, map);
% ma = round(ma * 255);
% ma = uint8(ma);
% % imshow(ma);
% 
% ind_red = ma(:,:,1) > 220;
% ind_green = ma(:,:,2) > 220;
% ind_blue = ma(:,:,3) > 220;
% 
% ind_red2 = ma(:,:,1) < 50;
% ind_green2 = ma(:,:,2) < 50;
% ind_blue2 = ma(:,:,3) < 50;
% 
% reddish = ind_red & ind_green2 & ind_blue2;
% greenish = ind_red2 & ind_green & ind_blue2;
% blueish = ind_red2 & ind_green2 & ind_blue;
% 
% fprintf('r : %d\n' , numel(find(reddish)))
% fprintf('g : %d\n' , numel(find(greenish)))
% fprintf('b : %d\n' , numel(find(blueish)))
% 
% a = ma(:,:,1); a(ind_red) = 166;
% b = ma(:,:,2); b(ind_green2) = 192;
% c = ma(:,:,3); c(ind_blue2) = 197;
% 
% ma = cat(3, a, b, c);
% imshow(ma);