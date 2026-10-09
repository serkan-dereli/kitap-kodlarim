%https://www.pantechsolutions.net/matlab-code-for-psnr-and-mse/amp
%clear all;
orj=imread('filtre_orj_peppers.png');
%test=imread('filtre_median_tb_peppers25.png');
test=filt_rg;
n=size(orj);
M=n(1);
N=n(2);
MSE = sum(sum((orj-test).^2))/(M*N);
PSNR = 10*log10(255*255/MSE);
SSIM=ssim(orj,test);