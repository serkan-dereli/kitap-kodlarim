clc;
clear all;
img=imread('sekil2.png');
img_gray=rgb2gray(img);
img_bw=im2bw(img_gray,0.15);
figure; imshow(img_gray);
figure; imshow(img_bw);

se=strel('disk',20);
img_bw2=imopen(img_bw,se);
figure; imshow(img_bw2);

