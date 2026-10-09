clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
aci=15;
kus_1=imrotate(kus_gray,aci,'bilinear','crop');
kus_2=imrotate(kus_gray,aci,'nearest','crop');
kus_3=imrotate(kus_gray,aci,'bicubic','crop');

figure(1); 
subplot(2,2,1); imshow(kus_gray); title('Orjinal');
subplot(2,2,2); imshow(kus_1); title('Bilinear');
subplot(2,2,3); imshow(kus_2); title('Nearest');
subplot(2,2,4); imshow(kus_3); title('Bicubic');