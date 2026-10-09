clc;
clear all;
coin=imread('coin.png');
figure(1); imshow(coin);
coin1=im2bw(coin);
figure(2); imshow(coin1);

%coin2 = imfill(coin1,'holes');
se=strel('disk',5);
coin2=imclose(coin1,se);
se2=strel('disk',7);
coin2=imerode(coin2,se2);

%coin2=coin1;
figure(3); imshow(coin2);
hold on;

B = bwboundaries(coin2);
text(10,10,strcat('Nesne Sayýsý:',num2str(length(B))),'color','y');
for k=1:length(B)
   hudut=B{k};
   plot(hudut(:,2),hudut(:,1),'.','LineWidth',1);
end

%3. aþama: özellikler tespit ediliyor
[bilgi, number]=bwlabel(coin2);
prop = regionprops(bilgi,'Area','Centroid');

figure(4); imshow(coin);
hold on;
total=0;
%sýnýflandýrma yapýlýyor
for n=1:number
   cent=prop(n).Centroid;
   x=cent(1);
   y=cent(2);
   if prop(n).Area>2000
      text(x-10,y,'5 C');
      total=total+5;
   else
      total=total+10;
      text(x-10,y,'10 C');
   end
end

