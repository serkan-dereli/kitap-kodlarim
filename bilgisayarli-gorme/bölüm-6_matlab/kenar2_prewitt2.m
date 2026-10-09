clc;
clear all;
A=imread('parca5.png');
G=rgb2gray(A);
C=double(G);
Gx=zeros(size(G));
Gy=zeros(size(G));
output_image=zeros(size(G));

for i=2:size(C,1)-1
    for j=2:size(C,2)-1
        %Sobel maske x-yönü için:
        %Gy(2,2)= (c(1,1)+c(1,2)+c(1,3)) - (2*c(3,2)+c(3,3)+c(3,1))
        Gy(i,j)=((C(i-1,j-1)+C(i-1,j)+C(i-1,j+1)) - (C(i+1,j-1)+C(i+1,j)+C(i+1,j+1)));

        %Sobel maske y-yönü için:
        %Gx(2,2)=(2*c(2,3)+c(1,3)+c(3,3) - (2*c(2,1)+c(1,1)+c(3,1))
        Gx(i,j)=((C(i-1,j+1)+C(i,j+1)+C(i+1,j+1)) - (C(i-1,j-1)+C(i,j-1)+C(i+1,j-1)));

        %Pikselin Bileþke Deðeri
        G(i,j)=abs(Gx(i,j))+abs(Gy(i,j));
        %G(i,j)=sqrt(Gx(i,j).^2+Gy(i,j).^2);
    end    
end

thresholdValue = 200; % varies between [0 255]
output_image = max(G, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;

figure; imshow(A); title('Orjinal');
figure; imshow(Gx); title('Gradyan-X');
figure; imshow(Gy); title('Gradyan-Y');
figure;imshow(G); title('Prewitt Gradient');
figure;imshow(output_image); title('Prewitt Gradient 2');
