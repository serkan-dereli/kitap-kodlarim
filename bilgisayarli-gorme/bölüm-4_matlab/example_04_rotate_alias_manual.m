clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
[m n]=size(kus_gray);
kus_2=zeros(m,n);
kus_2=im2uint8(kus_2);
x0=n/2;
y0=m/2;
aci=45;
for i=1:m
   for j=1:n
       x1=j;
       y1=i;
       x2=floor((x1-x0)*cosd(aci)-(y1-y0)*sind(aci)+x0);
       y2=floor((x1-x0)*sind(aci)+(y1-y0)*cosd(aci)+y0);
       if x2>0 && x2<n && y2>0 && y2<m
            kus_2(y2,x2)=kus_gray(i,j);
       end
   end
end

kus_2a=kus_2;
for i=2:m-1
   for j=2:n-1
       if kus_2a(i,j)==0
           ort_piksel=(kus_2a(i-1,j)+kus_2a(i+1,j)+kus_2a(i,j-1)+kus_2a(i,j+1))/4;
           kus_2a(i,j)=floor(ort_piksel);
       end
   end
end

kus_3=imrotate(kus_gray,-45,'bilinear');
figure(1); 
subplot(2,2,1); imshow(kus_gray); title('Orjinal');
subplot(2,2,2); imshow(kus_2); title('Döndürme');
subplot(2,2,3); imshow(kus_2a); title('Döndürme (Alias)');
subplot(2,2,4); imshow(kus_3); title('Bilineer');