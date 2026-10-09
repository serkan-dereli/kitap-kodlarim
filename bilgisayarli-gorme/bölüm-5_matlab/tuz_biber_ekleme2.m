%https://www.mathworks.com/help/images/ref/imnoise.html
clear all;
orj=imread('filtre_orj_peppers.png');
%grayImage=rgb2gray(orj);
noisyImage = imnoise(orj,'salt & pepper', 0.25);
imwrite(noisyImage,'filtre_tuzbiber_peppers25.png');
imshow(noisyImage);