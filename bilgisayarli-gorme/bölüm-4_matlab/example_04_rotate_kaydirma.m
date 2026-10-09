clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
[m n]=size(kus_gray);
kus_2=zeros(m,n);
kus_2=im2uint8(kus_2);
kus_2a=im2uint8(kus_2);
kus_2b=im2uint8(kus_2);
x0=floor(n/2);
y0=floor(m/2);
aci=30;

%saða kaydýrma
for i=1:m
   for j=1:n
       x1=j;
       y1=i;
       x2=floor((x1-x0)-(y1-y0)*tand(aci/2)+x0);
       y2=floor((y1-y0)+y0);
       if x2>0 && x2<n && y2>0 && y2<m
            kus_2(y2,x2)=kus_gray(i,j);
       end
   end
end

%aþaðý/yukarý kaydýrma
for i=1:m
   for j=1:n
       x1=j;
       y1=i;
       x2=floor((x1-x0)+x0);
       y2=floor((x1-x0)*sind(aci)+(y1-y0)+y0);
       if x2>0 && x2<n && y2>0 && y2<m
            kus_2a(y2,x2)=kus_2(i,j);
       end
   end
end

%yeniden saða kaydýrma
for i=1:m
   for j=1:n
       x1=j;
       y1=i;
       x2=floor((x1-x0)-(y1-y0)*tand(aci/2)+x0);
       y2=floor((y1-y0)+y0);
       if x2>0 && x2<n && y2>0 && y2<m
            kus_2b(y2,x2)=kus_2a(i,j);
       end
   end
end

kus_3=imrotate(kus_gray,-30,'bilinear','crop');
figure(1); 
subplot(1,3,1); imshow(kus_gray); title('Orjinal');
subplot(1,3,2); imshow(kus_2b); title('Döndürme');
subplot(1,3,3); imshow(kus_3); title('Bilineer');

figure(2); 
subplot(1,4,1); imshow(kus_gray); title('Orjinal');
subplot(1,4,2); imshow(kus_2); title('1. Saða Kaydýrma');
subplot(1,4,3); imshow(kus_2a); title('Aþaðý Kaydýrma');
subplot(1,4,4); imshow(kus_2b); title('2. Saða Kaydýrma');