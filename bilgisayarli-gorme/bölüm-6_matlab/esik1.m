clc;
clear all;
res=imread('parca3.png');
rg=rgb2gray(res);
%rg=medfilt2(rg, [5,5]);
level = graythresh(rg);
rb=im2bw(rg,0.58);

figure(1);
subplot(2,2,1);imshow(res); title('Orjinal');
subplot(2,2,2);imshow(rg); title('Gri Görüntü');
subplot(2,2,3);imshow(rb); title('Ýkili Görüntü');
subplot(2,2,4);imhist(rg); title('Histogram Grafiði');