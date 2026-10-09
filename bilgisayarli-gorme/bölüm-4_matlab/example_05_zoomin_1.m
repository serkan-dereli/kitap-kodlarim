%görüntü büyütme
%http://landofprogramming.blogspot.com/2014/08/write-matlab-code-to-perform-zooming.html
clc;
clear all;
kus_rgb=imread('kuslar_small.jpg');
b=rgb2gray(kus_rgb);

s=size(b);
c=[];
d=[];
zoom=input('Büyütme Oraný (Çarpan): ');

for n=1:s(1,1)
    for p=1:zoom
        c=[c;b(n,:)];
    end
end


for m=1:s(1,2)
    for p=1:zoom
        d=[d,c(:,m)];
    end
end

imshow(d);