%bu kod ortalama (mean) algoritmasýný iþlemektedir

clc;
clear all;
tic;
cek=3;
%r=imread('peppers.jpg');
%rg=rgb2gray(r);
rg=imread('filtre_tuzbiber_peppers.png'); 
[m,n]=size(rg);
v=zeros(cek,cek);
filt_rg=zeros(m,n);
for i=1:m-(cek-1)
   for j=1:n-(cek-1)
       cm=rg(i:(i+cek-1),j:(j+cek-1));
       ortalama = alchindusOrtalamaHesapla(cm,cek);
       filt_rg(i+1,j+1)=ortalama;
   end
end

sure=toc;
%binarization
rb=im2bw(rg);
filt_rg=uint8(filt_rg);
rbf=im2bw(filt_rg);

%imwrite(filt_rg,'filtre_mean_tb_peppers25.png');

%görüntüleme
figure(1);
subplot(2,2,1);imshow(rg); title('Resmin Orjinal Hali');
subplot(2,2,2);imshow(rb); title('Orjinal Binary');
subplot(2,2,3);imshow(filt_rg); title('5x5 Alchindus Filtresi');
subplot(2,2,4);imshow(rbf); title('Filtreli Binary');

