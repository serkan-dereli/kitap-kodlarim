%https://guraysonugur.aku.edu.tr/2022/01/03/2022-goruntu-isleme-dersi-nesne-tespit-kodlari/
clear;
close all;
clc;
a=imread('trafik_isaret.png');
r=a(:,:,1);%kýrmýzý bant ayrýldý
g=a(:,:,2);%yeþil bant ayrýldý
b=a(:,:,3);%mavi bant ayrýldý
gri=rgb2gray(a);%resim gri seviye yapýldý
mavi=imsubtract(b,gri); %kýrmýzý banttan gri seviye çýkarýlarak sadece kýrmýzý olanlar bulunuyor.

BW_mavi=mavi>50;

se=[0 1 0; 1 1 1; 0 1 0];
BW_mavi = imdilate(BW_mavi,se);

[etiketlenmisGoruntu, nesneSayisi]=bwlabel(BW_mavi);
fprintf('Ýmgedeki mavi renkli nesne sayýsý=%d\n',nesneSayisi);

nesneler=regionprops(BW_mavi,'Centroid','Area','BoundingBox');
tablo=regionprops('table',BW_mavi,'Centroid','Area','BoundingBox');
[alan,indeks]=max(tablo.Area);

if indeks>0
    figure(1);
    subplot(121);imshow(a); title('Orjinal')
    subplot(122);imshow(BW_mavi); 
    title(sprintf('Mavi nesne sayýsý: %s',num2str(nesneSayisi)));    

    for i=1:length(nesneler)
        rectangle('Position',nesneler(i).BoundingBox,'EdgeColor','y','LineWidth',2);
        hold on
        plot(nesneler(i).Centroid(1),nesneler(i).Centroid(2),'bo', 'LineWidth',5);
    end
end