clear all;
res_gray=imread('filtre_tuzbiber_peppers3.png'); 
%res_gray=rgb2gray(res_orj);
medyanFiltresi=medfilt2(res_gray, [3,3]);
res_bin=im2bw(res_gray);
res_bin2=im2bw(medyanFiltresi);

%imwrite(res_gray,'filtre_orj_lenna.png');

%imwrite(medyanFiltresi,'filtre_median_tb_peppers5.png');
 
figure(1);
subplot(2,2,1);imshow(res_gray); title('Resmin Orjinal Hali');
subplot(2,2,2);imshow(res_bin); title('Orjinal Binary');
subplot(2,2,3);imshow(medyanFiltresi); title('5x5 Medyan Filtresi');
subplot(2,2,4);imshow(res_bin2); title('Filtreli Binary');
