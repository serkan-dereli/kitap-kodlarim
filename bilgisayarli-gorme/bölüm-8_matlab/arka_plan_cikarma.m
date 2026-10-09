clc;
clear all;

%adým-1
zemin=imread('arka_plan.png');
resim=imread('arka_plan2.png');

%adým-2: filtreleme
ze_gri=medfilt2(rgb2gray(zemin));
re_gri=medfilt2(rgb2gray(resim));
figure(1); imshow(zemin);
figure(2); imshow(re_gri);

%adim-3: arka plan çýkarma
fark1=imsubtract(ze_gri,re_gri);
fark2=imsubtract(re_gri,ze_gri);
fark=fark1+fark2;
figure(3); imshow(fark1);
figure(4); imshow(fark2);
figure(5); imshow(fark);

%adým-4: binary dönüþüm
level=graythresh(fark);
fark_bin=im2bw(fark,level-level*0.25);
figure(6); imshow(fark_bin);

%adým-5: morfoloji
se=strel('square',2);
fark_bin2 = imopen(fark_bin,se);
se2=strel('disk',5);
fark_bin3=imdilate(fark_bin2,se2);
figure(7); imshow(fark_bin2);
figure(8); imshow(fark_bin3);

%adým-6: nesnelerin tespiti, özellik çýkarýmý
hold on;
B = bwboundaries(fark_bin3);
[bilgi,number]=bwlabel(fark_bin3);
prop=regionprops(bilgi,'Area','Centroid');

for n=1:number
   cent=prop(n).Centroid;
   x=cent(1);
   y=cent(2);
   area=prop(n).Area;
   text(x-10,y,strcat(num2str(n),' - ',num2str(area)),'FontSize',18,'Color','blue');
end

%adým-7: nesnelerin çerçevelenmesi
figure(9);imshow(resim);
hold on;
for i=1:length(B)
   b=B{i};
   bx=[min(b(:,2)) min(b(:,2)) max(b(:,2)) max(b(:,2)) min(b(:,2))];
   by=[min(b(:,1)) max(b(:,1)) max(b(:,1)) min(b(:,1)) min(b(:,1))];
   plot(bx,by,'y','LineWidth',2);
end








