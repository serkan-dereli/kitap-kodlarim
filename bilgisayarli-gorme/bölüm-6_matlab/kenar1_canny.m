clc; 
clear all;
res = imread('parca5.png');
rgri=rgb2gray(res);
rg=medfilt2(rgri, [7 7]);
%rg = imfilter(rgri,fspecial('average',[5,5]),'replica');
rb = im2bw(rg);

%kenar bulma
c=edge(rg, 'canny');

figure;imshow(res); title('Orjinal');
figure;imshow(rg); title('Gri Görüntü');
figure;imshow(rb); title('Ýkili Görüntü');
figure;imshow(c); title('Canny Kenar');