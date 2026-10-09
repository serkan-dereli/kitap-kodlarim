%görüntü küçültme (shrink)
%http://landofprogramming.blogspot.com/2014/08/write-matlab-code-to-perform-zooming.html
clc;
clear all;
kus_rgb=imread('kuslar.jpg');
b=rgb2gray(kus_rgb);

s=size(b);
c=[];
d=[];
zoom=input('Küçültme Oraný (1/x): ');

%satýr sayýsýný azaltma
for n=1:zoom:s(1,1) 
    c=[c;b(n,:)];
end

%sütun sayýsýný azaltma
for m=1:zoom:s(1,2)   
    d=[d,c(:,m)];
end

figure(1); imshow(d);
title('Küçültülmüþ Yeni Görüntü');

figure(2); imshow(b);
title('Orjinal Görüntü');