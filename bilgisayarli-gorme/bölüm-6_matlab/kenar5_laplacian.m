clc;
clear all;
A=imread('parca5.png');
G4=rgb2gray(A);
G8=rgb2gray(A);
C=double(G4);
%output_image=zeros(size(G));

for i=2:size(C,1)-1
    for j=2:size(C,2)-1   
        %merkez deðer=4
        G4(i,j)=(4*C(i,j) - (C(i-1,j)+C(i,j+1)+C(i+1,j)+C(i,j-1)));
        
        %merkez deðer=8
        G8(i,j)=(8*C(i,j) - (C(i-1,j)+C(i,j+1)+C(i+1,j)+C(i,j-1)+C(i-1,j+1)+C(i+1,j+1)+C(i-1,j+1)+C(i-1,j-1)));
    end    
end

%thresholdValue = 10; % varies between [0 255]
%output_image = max(G, thresholdValue);
%output_image(output_image == round(thresholdValue)) = 0;

figure; imshow(A); title('Orjinal');
figure;imshow(G4); title('Laplacian Kenarlar C=4');
figure;imshow(G8); title('Laplacian Kenarlar C=8');
