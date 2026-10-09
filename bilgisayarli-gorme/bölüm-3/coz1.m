clc;
clear all;
a=imread('1-res.png');
b=imread('1-res2.png');
c=imread('1-res3.png');
d=imread('1-res4.png');

figure(1);imshow(a)
figure(2);imshow(b)
figure(3);imshow(c)
figure(4);imshow(d)

%subplot(1,4,1), imshow(a), title('576x480');
%subplot(1,4,2), imshow(b), title('288x240');
%subplot(1,4,3), imshow(c), title('144x120');
%subplot(1,4,4), imshow(d), title('72x60');