%görüntü büyütme
%http://landofprogramming.blogspot.com/2014/08/write-matlab-code-to-perform-zooming.html
clc;
clear all;
b=imread('kuslar.jpg');

s=size(b);
c=[];
cx=[];
d=[];
dx=[];
zoom=input('Büyütme Oraný (Çarpan): ');
for k=1:3
    for n=1:s(1,1)
        for p=1:zoom
            c=[c;b(n,:,k)];
        end
    end
    cx(:,:,k)=c;
    c=[];
end

for k=1:3
    c=cx(:,:,k);
    for m=1:s(1,2)
        for p=1:zoom
            d=[d,c(:,m)];
        end
    end
    dx(:,:,k)=d;
    d=[];
    c=[];
end
dx=uint8(dx);
imwrite(dx,'kuslar8x.jpg');
figure(1);imshow(b); title('Orjinal Görüntü (x)');
figure(2);imshow(dx); title('Büyütülmüþ Yeni Görüntü (4x)');