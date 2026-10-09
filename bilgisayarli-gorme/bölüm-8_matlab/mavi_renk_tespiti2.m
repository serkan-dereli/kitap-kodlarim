%https://guraysonugur.aku.edu.tr/2022/01/03/2022-goruntu-isleme-dersi-nesne-tespit-kodlari/
clear;
close all;
clc;
a=imread('trafik_isaret.png');
r=a(:,:,1);%kýrmýzý bant ayrýldý
g=a(:,:,2);%yeþil bant ayrýldý
b=a(:,:,3);%mavi bant ayrýldý
gri=rgb2gray(a);%resim gri seviye yapýldý
filt_gri=medfilt2(gri);
figure(1); imshow(b); title('Mavi Kanal');
figure(2); imshow(gri); title('Gri');

%mavi banttan gri seviye çýkarýlarak sadece mavi olanlar bulunuyor.
mavi=imsubtract(b,filt_gri);

BW_mavi=mavi>50;

se=[0 1 0; 1 1 1; 0 1 0];
BW_mavi = imdilate(BW_mavi,se);

[etiketlenmisGoruntu, nesneSayisi]=bwlabel(BW_mavi);
fprintf('Ýmgedeki tespit edilen nesne sayýsý=%d\n',nesneSayisi);
prop=regionprops(etiketlenmisGoruntu,'Area','Centroid','BoundingBox');

figure(3); imshow(a); title('Orjinal')
figure(4); imshow(BW_mavi);  
hold on

n=0;
for i=1:length(prop)
    alan=prop(i).Area;
    if alan>1000
        n=n+1;
        rectangle('Position',prop(i).BoundingBox,'EdgeColor','y','LineWidth',2);    
        plot(prop(i).Centroid(1),prop(i).Centroid(2),'bo', 'LineWidth',5);
    end    
end
title(sprintf('Mavi nesne sayýsý: %s',num2str(n)));   
fprintf('Ýmgedeki tespit edilen mavi renkli nesne sayýsý=%d\n',n);