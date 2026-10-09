clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
[m n]=size(kus_gray);
kus_2=zeros(m,n);
kus_2=im2uint8(kus_2);
x=100;
y=40;
for i=41:m
   for j=1:n
       kus_2(i-y,j+x)=kus_gray(i,j);
   end
end
figure(1); 
subplot(1,2,1); imshow(kus_gray); title('Orjinal');
subplot(1,2,2); imshow(kus_2); title('Kaydýrma');