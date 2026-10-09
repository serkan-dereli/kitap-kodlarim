%bu kod algoritmasý aþaðýdaki gibi olan bir filtreleme iþlemidir
%farký: medyan ve avg filtrelerin üstün taraflarýný seçer
%ismi: ortalamaya en yakýn piksel deðeri

%1.çekirdek matrisi elde eder
%2.matris deðerlerinin ortalamasýný alýr
%3.her bir deðerin ortalamaya olan uzaklýðýný hesaplar
%4.ortalama deðere en kýsa mesafede olan piksel deðerini seçer


clc;
clear all;
tic;
cek=5;
%r=imread('peppers.jpg');
%rg=rgb2gray(r);
rg=imread('filtre_tuzbiber_peppers5.png'); 
[m,n]=size(rg);
v=zeros(cek,cek);
filt_rg=zeros(m,n);
ex=0; % iç içe döngüyü kýrmak için
for i=1:m-(cek-1)
   for j=1:n-(cek-1)
       cm=rg(i:(i+cek-1),j:(j+cek-1));
       cm_db=abs(double(cm)-mean(cm(:)));
       cm_min=min(cm_db(:));
       for a=1:cek
          for b=1:cek
             x=cm_db(a,b);
             if x==cm_min
                 filt_rg(i+1,j+1)=cm(a,b);
                 ex=1;
                 break;
             else
                 filt_rg(i+1,j+1)=-1;
             end             
          end
          if ex>0
              ex=0;
              break;           
          end
       end
   end
end

%sütun sonu doldurma
for i=1:m-(cek-3)
   for j=n-(cek-2):n-1
       son_cek_ort=uint8(mean(filt_rg(i,j-cek-1:j-1)));
       %filt_rg(i,j)=filt_rg(i,j-1);
       filt_rg(i,j)=son_cek_ort;
   end
end

%satýr sonu doldurma
for i=m-(cek-2):m-1
   for j=1:n
       son_cek_ort=uint8(mean(filt_rg(i-cek-1:i-1,j)));
       %filt_rg(i,j)=filt_rg(i-1,j);
       filt_rg(i,j)=son_cek_ort;
   end
end
sure=toc;
%binarization
rb=im2bw(rg);
filt_rg=uint8(filt_rg);
rbf=im2bw(filt_rg);

imwrite(filt_rg,'filtre_Alchindus_tb_peppers5.png');

%görüntüleme
figure(1);
subplot(2,2,1);imshow(rg); title('Resmin Orjinal Hali');
subplot(2,2,2);imshow(rb); title('Orjinal Binary');
subplot(2,2,3);imshow(filt_rg); title('5x5 Alchindus Filtresi');
subplot(2,2,4);imshow(rbf); title('Filtreli Binary');

