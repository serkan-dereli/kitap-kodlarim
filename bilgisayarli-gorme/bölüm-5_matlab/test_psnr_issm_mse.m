%https://www.mathworks.com/help/images/ref/immse.html

clear all;
orj=imread('filtre_orj_peppers.png');
test=imread('filtre_tuzbiber_peppers5.png');
Result=CalcPerf(orj,test);
ssim=ssim(orj,test);
mse=immse(orj,test);