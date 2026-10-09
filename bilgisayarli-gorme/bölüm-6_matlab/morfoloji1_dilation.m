clear all;
yazi =imread('yazi.jpg');
yazi_gray=rgb2gray(yazi);
yazi_bw=im2bw(yazi_gray, 0.95);
figure; imshow(yazi);

yazi_bw1=imcomplement(yazi_bw); %tersleme iþlemi
%figure; imshow(yazi_bw1);

se=[0 1 0; 1 1 1; 0 1 0];
%se = strel('square',2); %yapýsal eleman
yazi_bw2 = imdilate(yazi_bw1,se);
yazi_bw2 = imcomplement(yazi_bw2);
figure; imshow(yazi_bw2);
