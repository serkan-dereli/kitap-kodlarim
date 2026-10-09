clear
close all
clc
at = imread('at_orjinal.jpg');
at_gray = rgb2gray(at);
[hog1,visualization] = extractHOGFeatures(at,'CellSize',[32 32]);
%[at_hog] = HOG(at_gray);
[at_hog] = hog_feature_vector(at);
figure
subplot(1,3,1);
imshow(at);
subplot(1,3,2);
plot(visualization);
subplot(1,3,3);
plot(at_hog);
