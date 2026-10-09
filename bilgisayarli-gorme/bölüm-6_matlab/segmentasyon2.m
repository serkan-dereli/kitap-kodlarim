clc; 
clear all;
coin = imread('para1.png');
coin1 = im2bw(coin); 
figure; imshow(coin1); title('Ýkili Dönüþüm');
%morfolojik düzeltmeler
se=strel('disk',5);
m=imdilate(coin1,se);
figure; imshow(m); title('Morfoloji-1');
se1=strel('disk',9);
m2 = imerode(m,se1);
figure; imshow(m2); title('Morfoloji-2');
m3 = imopen(m2,se1);
figure; imshow(m3); title('Morfoloji-3');
%----------
%kenar bulma
c=edge(coin1, 'canny');
figure; imshow(c); title('Kenar Tespiti');
figure; imshow(coin); title('Orjinal');
figure; imshow(m3); title('Nesnelerin Tespiti');
hold on;
B = bwboundaries(m3); 
text(10,10,strcat('\color{white}Nesne Sayýsý:', num2str(length(B))));
for k=1:length(B)
	hudut = B{k}; 			    	
    plot(hudut(:,2),hudut(:,1),'o','LineWidth',1);
end
