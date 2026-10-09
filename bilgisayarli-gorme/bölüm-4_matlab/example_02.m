clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb); %rgb yi gri görüntüye dönüþtür
kus_bin=im2bw(kus_gray); %gri yi ikili görüntüye dönüþtür

yapay_kirmizi=kus_rgb;
yapay_kirmizi(:,:,2)=0; %yeþil kanal 0 yapýldý
yapay_kirmizi(:,:,3)=0; %mavi kanal 0 yapýldý

yapay_yesil=kus_rgb;
yapay_yesil(:,:,1)=0; %kýrmýzý kanal 0 yapýldý
yapay_yesil(:,:,3)=0; %mavi kanal 0 yapýldý

yapay_mavi=kus_rgb;
yapay_mavi(:,:,1)=0; %kýrmýzý kanal 0 yapýldý
yapay_mavi(:,:,2)=0; %yeþil kanal 0 yapýldý

figure(1); 
subplot(2,3,1); imshow(kus_rgb); title('Orjinal RGB');
subplot(2,3,2); imshow(kus_gray); title('Gri');
subplot(2,3,3); imshow(kus_bin); title('Ýkili');
subplot(2,3,4); imshow(yapay_kirmizi); title('Yapay Kýrmýzý');
subplot(2,3,5); imshow(yapay_yesil); title('Yapay Yeþil');
subplot(2,3,6); imshow(yapay_mavi); title('Yapay Mavi');