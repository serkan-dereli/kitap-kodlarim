clc;
clear all;
ag=imread('sekil3.png');
%ag=rgb2gray(a);
se=strel('disk',8);
b=imopen(ag,se);
figure(1); imshow(ag);
figure(2); imshow(b);
