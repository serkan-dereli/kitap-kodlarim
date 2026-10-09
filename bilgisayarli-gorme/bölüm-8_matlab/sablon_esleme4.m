clc;
clear all;
tic;
sablon=imread('face_temp2.png');
kaynak=imread('face_sablon14.png');
sablonGri=rgb2gray(sablon);
kaynakGri=rgb2gray(kaynak);
r=corr2(sablonGri,kaynakGri);
toc;
