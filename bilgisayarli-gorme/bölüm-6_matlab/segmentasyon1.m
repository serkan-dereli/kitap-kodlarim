clc; 
clear all;
coin = imread('para1.png');
coin1 = im2bw(coin); 
figure; imshow(coin1); title('Ýkili Dönüþüm');
%kenar bulma
c=edge(coin1, 'canny');
figure; imshow(c); title('Kenar Tespiti');
figure; imshow(coin); title('Orjinal');
figure; imshow(coin1); title('Nesnelerin Tespiti');
hold on;
B = bwboundaries(coin1); 
text(10,10,strcat('\color{white}Nesne Sayýsý:', num2str(length(B))));
for k=1:length(B)
	hudut = B{k}; 			    	
    plot(hudut(:,2),hudut(:,1),'o','LineWidth',1);
end
