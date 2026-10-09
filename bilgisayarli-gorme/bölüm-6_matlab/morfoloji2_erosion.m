clear all;
img =imread('sekiller.png');
img_gray=rgb2gray(img);
img_bw=im2bw(img_gray,0.55);
figure; imshow(img_gray);
figure; imshow(img_bw);

img_bw=imcomplement(img_bw);
se=strel('square',50);
%se=[0 1 0; 1 1 1; 0 1 0];
img_bw1=imerode(img_bw,se);
figure; imshow(img_bw1);