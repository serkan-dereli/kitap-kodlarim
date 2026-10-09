clc;
clear all;
res=imread('g_parca2.jpg');
res_gri=rgb2gray(res);

T0=mean(res_gri(:));

A1=res_gri(1:235,1:313);
T1=mean(A1(:));

A2=res_gri(235:470,1:313);
T2=mean(A2(:));

A3=res_gri(1:235,313:626);
T3=mean(A3(:));

A4=res_gri(235:470,313:626);
T4=mean(A4(:));
