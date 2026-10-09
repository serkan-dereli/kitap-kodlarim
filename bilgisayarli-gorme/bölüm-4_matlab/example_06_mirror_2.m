%https://www.geeksforgeeks.org/create-mirror-image-using-matlab/
%08.02.2021, pazartesi
%Dikey aynalama (x-eksenine göre)
clc;
clear all;
img=imread('kuslar.jpg');
img2=img;
[x, y, z] = size(img); 
m_img=[];
  
for d = 1: z 
    for i = 1 : x 
        sut = y;  
        for j = 1 : y 
            %piksellerin yer deðiþtirilmesi      
            if j < y/2  
                temp = img(i, j, d); 
                img(i, j, d) = img(i, sut, d); 
                img(i, sut, d) = temp; 
                sut = sut - 1; 
            end
        end
    end
end  
  
subplot(1,2,1),subimage(img2); title('Orjinal Görüntü');
subplot(1,2,2),subimage(img); title('Aynalanmýþ Görüntü (Yatay)');