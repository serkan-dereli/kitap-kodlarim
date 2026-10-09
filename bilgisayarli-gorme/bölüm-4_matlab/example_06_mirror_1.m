%https://www.geeksforgeeks.org/create-mirror-image-using-matlab/
%07.02.2021, pazar
clc;
clear all;
img=imread('kuslar.jpg');

%her bir satýrýn terslenmesi
m_img = flip(img, 1);
m_img2 = flip(img, 2);

subplot(1,3,1),subimage(img); title('Orjinal Görüntü');
subplot(1,3,2),subimage(m_img); title('Aynalanmýþ Görüntü (Dikey)');
subplot(1,3,3),subimage(m_img2); title('Aynalanmýþ Görüntü (Yatay)');