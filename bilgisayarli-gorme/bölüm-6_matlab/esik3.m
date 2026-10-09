clc;
clear all;
res=imread('at_orjinal.jpg');
rg=rgb2gray(res);
level = graythresh(rg);
rb1=im2bw(rg,0.5);
rb2=im2bw(rg,0.7);
rb3=im2bw(rg,0.9);

figure(1);
subplot(2,3,1);imshow(res); title('Orjinal');
subplot(2,3,2);imshow(rg); title('Gri Görüntü');
subplot(2,3,3);imhist(rg); title('Histogram Grafiði');
subplot(2,3,4);imshow(rb1); title('Ýkili Görüntü (T=0.5)');
subplot(2,3,5);imshow(rb2); title('Ýkili Görüntü (T=0.7)');
subplot(2,3,6);imshow(rb3); title('Ýkili Görüntü (T=0.9)');