clc;
clear all;
im = imread('parca5.png');
im_d = im2double(im);
im = rgb2gray(im_d);
hx = [+1 0; 0 -1];
hy = [0 +1; -1 0];
Gx = imfilter(im, hx);
Gy = imfilter(im, hy);
Gm = sqrt(Gx.^2 + Gy.^2);

Gx=im2uint8(Gx);
Gy=im2uint8(Gy);
Gm=im2uint8(Gm);

figure;imshow(im); title('Orjinal');
figure;imshow(Gx); title('Gradyan-X');
figure;imshow(Gy); title('Gradyan-Y');
figure;imshow(Gm); title('Kenar');