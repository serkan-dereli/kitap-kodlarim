clc;
clear all;
disp('Silindir Hacim Hesabý');
disp('-----------------');
h=input('Yükseklik Deðerini giriniz (cm): ');
r=input('Taban Yarýçap Deðerini giriniz (cm): ');
v = (pi * r^2) * h;
disp(['Silindirin hacmi= ' num2str(v) ' cm3 tür.']);