clc;
clear all;
kus_rgb=imread('kuslar.jpg');
kus_gray=rgb2gray(kus_rgb);
[m n]=size(kus_gray);
kus_2=zeros(m,n);
kus_2=im2uint8(kus_2);
x0=n/2;
y0=m/2;
aci=pi/4;
for i=1:m
   for j=1:n
       x1=j;
       y1=i;
       
       %Aliaslý Döndürme -Saða Kaydýrma
       x2 = (x1 - x0) - tan(aci/2) * (y1 - y0) + x0;
       y2 = (y1 - y0) + y0;
       x2=round(x2);
       y2=round(y2);
       
       %Aliaslý Döndürme -Aþaðý kaydýrma
       x2 = (x2 - x0) + x0;
       y2 = sin(aci) * (x2 - x0) + (y2 - y0) + y0;
       
       if x2>0 && x2<n && y2>0 && y2<m
            kus_2(y2,x2)=kus_gray(i,j);
       end
   end
end
figure(1); 
subplot(1,2,1); imshow(kus_gray); title('Orjinal');
subplot(1,2,2); imshow(kus_2); title('Kaydýrma');