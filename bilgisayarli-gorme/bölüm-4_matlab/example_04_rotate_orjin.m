clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
[m n]=size(kus_gray);
kus_2=zeros(m,n);
kus_2=im2uint8(kus_2);
aci=15;
for i=1:m
   for j=1:n
       x1=j;
       y1=i;
       x2=floor(x1*cosd(aci)-y1*sind(aci));
       y2=floor(x1*sind(aci)+y1*cosd(aci));
       if x2>0 && x2<n && y2>0 && y2<m
            kus_2(y2,x2)=kus_gray(i,j);
       end
   end
end

figure(1); 
subplot(1,2,1); imshow(kus_gray); title('Orjinal');
subplot(1,2,2); imshow(kus_2); title('Döndürme');