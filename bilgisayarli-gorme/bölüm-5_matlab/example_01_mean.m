clc;
clear all;
%res_orj=imread('peppers.jpg'); %Resim Yüklendi.
%res_gray=rgb2gray(res_orj);
res_gray=imread('filtre_tuzbiber_peppers3.png'); 
res_dbl=im2double(res_gray); %Double tipine çevrildi.
mean_filtre=fspecial('average',3); %maske 5x5lük
filtreli_resim=imfilter(res_dbl,mean_filtre,'replicate'); 
res_bin=im2bw(res_gray);
res_bin2=im2bw(filtreli_resim); 

filtreli_resim=im2uint8(filtreli_resim);
%imwrite(filtreli_resim,'filtre_mean_tb_peppers5.png');

figure(1);
subplot(2,2,1);imshow(res_gray); title('Resmin Orjinal Hali (a)');
subplot(2,2,2);imshow(res_bin); title('Orjinal Binary (b)');
subplot(2,2,3);imshow(filtreli_resim); title('5x5 Average Filtresi (c)');
subplot(2,2,4);imshow(res_bin2); title('Filtreli Binary (d)');