clc;
clear all;
res=imread('g_parca2.jpg');
f=rgb2gray(res);
T=0.5*(double(min(f(:)))+double(max(f(:))));
a=0;
while a<=0
 	g=f>=T;
	Tnext=0.5*(mean(f(g))+mean(f(~g)));
	x=abs(T-Tnext);
    if x<0.5
       a=1; 
    end
	T=Tnext;
end

figure(1);
subplot(1,3,1);imshow(res); title('Orjinal');
subplot(1,3,2);imshow(f); title('Gri Görüntü');
subplot(1,3,3);imshow(g); title(sprintf('Ýkili Görüntü, T=%s',num2str(T)));

figure(2); imhist(f); title('Histogram Grafiði');