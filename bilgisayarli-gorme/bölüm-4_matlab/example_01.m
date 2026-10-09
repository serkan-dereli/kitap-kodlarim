clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
kus_bin=im2bw(kus_gray);
figure(1); 
subplot(1,3,1); imshow(kus_rgb); title('RGB');
subplot(1,3,2); imshow(kus_gray); title('Gri');
subplot(1,3,3); imshow(kus_bin); title('Ýkili');

figure(2); imshow(kus_gray); title('Gri Görüntü');
hold on;
rectangle('Position',[150,300,5,10]) %x,y,w,h

figure(3); imshow(kus_rgb); title('RGB Görüntü');
hold on;
rectangle('Position',[50,300,5,10]) %x,y,w,h