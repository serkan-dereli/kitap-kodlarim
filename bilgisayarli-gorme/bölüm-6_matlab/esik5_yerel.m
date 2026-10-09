clc;
clear all;
sat_cer=10;
sut_cer=10;
res=imread('g_parca2.jpg');
rg=rgb2gray(res);
[sat,sut]=size(rg);
x=round(sut/sut_cer)-1; %156
y=round(sat/sat_cer)-1; %117
bolge=zeros(y,x);
rb=zeros(y,x);
for m=0:sat_cer-1
   for n=0:sut_cer-1
       y1=m*y+1;
       y2=m*y+y;
       x1=n*x+1;
       x2=n*x+x;
       bolge(:,:)=rg(y1:y2,x1:x2);
       bolge=uint8(bolge);
       T=mean(bolge(:));      
       bolge_rb=im2bw(bolge);
       rb(y1:y2,x1:x2)=bolge_rb;
   end
end

figure(1);
subplot(2,2,1);imshow(res); title('Orjinal');
subplot(2,2,2);imshow(rg); title('Gri Görüntü');
subplot(2,2,3);imshow(rb); title('Ýkili Görüntü');
subplot(2,2,4);imhist(rg); title('Histogram Grafiði');
