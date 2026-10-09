clc; 
clear all;
res = imread('parca5.png');
res_d = im2double(res);
rgri=rgb2gray(res_d);
%rg=medfilt2(rgri, [7 7]);
rg = imfilter(rgri,fspecial('average',[5,5]),'replica');

%prewitt operatör - gradient tabanlý kenar bulma
Kx=1/3*[-1 0 1; -1 0 1; -1 0 1];
Ky=1/3*[-1 -1 -1; 0 0 0; 1 1 1];

%konvolüsyon
Gx=imfilter(rg,Kx);
Gy=imfilter(rg,Ky);
Gm = sqrt(Gx.^2 + Gy.^2);

figure;imshow(res);title('Orjinal')
figure;imshow(Gx);title('Gradyan-x')
figure;imshow(Gy);title('Gradyan-Y')
figure;imshow(Gm);title('Kenar')