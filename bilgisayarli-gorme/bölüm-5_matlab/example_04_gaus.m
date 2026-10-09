clear all;
tic;
%res_orj=imread('lenna.png');
%res_gray=rgb2gray(res_orj);
res_gray=imread('filtre_tuzbiber_peppers3.png'); 
res_dbl=im2double(res_gray); 
gaus_filtre_cekirdegi=fspecial('gaussian',3,3);  
gaus_filtreli_resim=imfilter(res_gray,gaus_filtre_cekirdegi,'replicate'); 
res_bin=im2bw(res_gray);
res_bin2=im2bw(gaus_filtreli_resim);

imwrite(gaus_filtreli_resim,'filtre_gauss_tb_peppers5.png');
toc;

figure(1);
subplot(2,2,1);imshow(res_gray); title('Resmin Orjinal Hali');
subplot(2,2,2);imshow(res_bin); title('Orjinal Binary');
subplot(2,2,3);imshow(gaus_filtreli_resim); title('5x5 Gauss Filtresi');
subplot(2,2,4);imshow(res_bin2); title('Filtreli Binary');