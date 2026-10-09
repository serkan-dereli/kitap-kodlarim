%görüntü büyütme
%bilinear interpolation
%https://supuntharanga.blogspot.com/2013/07/image-zooming-with-matlab-sample-codes.html
%28.01.2021, perþembe

clc;
clear all;
kus_rgb=imread('kuslar.jpg');

a=imread('kuslar.jpg');      %import image"y.jpg"

[row col d] = size(a);  %3 dimentional array
zoom=4;                 %zooming factor
zr=zoom*row;
zc=zoom*col;

for i=1:zr    
    x=i/zoom;    
    x1=floor(x);
    x2=ceil(x);
    if x1==0
        x1=1;
    end
    xint=rem(x,1); %x i tamsayýya dönüþtürür
    for j=1:zc        
        y=j/zoom;        
        y1=floor(y);
        y2=ceil(y);
        if y1==0
            y1=1;
        end
        yint=rem(y,1);        
        Q11=a(x1,y1,:);  %BL
        Q12=a(x1,y2,:);  %TL
        Q21=a(x2,y1,:);  %BR
        Q22=a(x2,y2,:);  %TR
        
        R1=Q21*yint+Q11*(1-yint); %R1=BR*yint+BL*(1-yint);
        R2=Q22*yint+Q12*(1-yint); %R2=TR*yint+TL*(1-yint);
        
        b(i,j,:)=R1*xint+R2*(1-xint);
    end
end
imwrite(b,'kuslar4x_.jpg');
imshow(b);
title('Büyütülmüþ Görüntü (4x)')