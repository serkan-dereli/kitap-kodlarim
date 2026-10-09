%https://www.pantechsolutions.net/matlab-code-for-psnr-and-mse/amp
clear all;
orj_img = imread('face_temp2.png');
o_imgG=rgb2gray(orj_img);
test_img = imread('face_temp2.png');
t_imgG=rgb2gray(test_img);

n=size(o_imgG);
M=n(1);
N=n(2);
MSE = sum(sum((o_imgG-t_imgG).^2))/(M*N);
PSNR = 10*log10(255*255/MSE);
SSIM=ssim(o_imgG,t_imgG);