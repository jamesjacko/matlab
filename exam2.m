close all
clear all
clc

ben = imread('ben.png');
croppedBen = ben(60:200, 190:270, :);


framedImage = frameImage(croppedBen);
imshow(framedImage)