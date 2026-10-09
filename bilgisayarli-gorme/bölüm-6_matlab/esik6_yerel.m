clc;
clear all;
res=imread('g_parca2.jpg');
res_gri=rgb2gray(res);
ort_medyan=medfilt2(res_gri,[30 30]);
fark_medyan = ort_medyan-res_gri-2;
ikili_medyan = im2bw(fark_medyan,0);

ort_mean = imfilter(res_gri,fspecial('average',[25,25]),'replica');
fark_mean = ort_mean-res_gri-5;
ikili_mean = im2bw(fark_mean,0);
ikili_mean2=im2double(fark_mean);

figure(1);
subplot(3,3,1);imshow(res); title('Orjinal');
subplot(3,3,2);imshow(ort_medyan); title('Ortalama Medyan');
subplot(3,3,3);imshow(fark_medyan); title('Fark Medyan');
subplot(3,3,4);imshow(ikili_medyan); title('Ýkili Medyan');
subplot(3,3,5);imshow(ort_mean); title('Ortalama Mean');
subplot(3,3,6);imshow(fark_mean); title('Fark Mean');
subplot(3,3,7);imshow(ikili_mean); title('Ýkili Mean');