clc;
clear all;
im=imread('parca3.png');
tot=0;
[a,b,c]=size(im);
y=zeros(a,b); %ikili görüntü matrisi
g=zeros(a,b); %gri görüntü matrisi

%gri görüntü dönüþümü yapýlýyor
for i=1:a
    for j=1:b
        %gri görüntü için her kanaldaki deðer toplanýp
        %3 e bölünüyor
        g(i,j)=im(i,j,1)*0.299 + im(i,j,2)*0.587 + im(i,j,3)*0.114;
    end
end
g=uint8(g);
x=im2double(g);

%tüm piksel deðerleri toplanýyor
for i=1:a
    for j=1:b
        tot=tot+x(i,j);
    end
end

%genel ortalama alýnýyor ve bu deðer eþik deðeri kabul ediliyor
thr=tot/(a*b); %thr=mean(x(:));

%her bir piksel deðeri eþik deðeri ile karþýlaþtýrýlýyor
for i=1:a
    for j=1:b
        if x(i,j) > thr
            y(i,j)=1;
        else
            y(i,j)=0;
        end
    end
end

z=logical(y); %ikili görüntü tip dönüþümü

figure(1);
subplot(1,3,1);imshow(im); title('Orjinal');
subplot(1,3,2);imshow(g); title('Gri Görüntü');
subplot(1,3,3);imshow(z); title(sprintf('Ýkili Görüntü, T=%s',num2str(thr)));
