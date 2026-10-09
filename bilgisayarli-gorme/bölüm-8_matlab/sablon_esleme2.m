clc;
clear all;
tic;
pozKatsayi = 0;
pozKatDizi = zeros(50,1);
temp=imread('p_msaribiyik3.png');
list=imread('hoca_listesi2.png');

tempG=rgb2gray(temp);
listG=rgb2gray(list);

[sat,sut]=size(listG);
[tx,ty]=size(tempG);

figure(1); imshow(listG); 
hold on;

r0=0.4;
for i=1:sat
   for j=1:sut
       if (i+tx<=sat && j+ty<=sut)
            ara=listG(i:i+(tx-1),j:j+(ty-1));
            r=corr2(tempG,ara);
            if r > r0
                r0 = r;
                pozKatsayi = pozKatsayi + 1;
                pozKatDizi(pozKatsayi,1) = r;
                bx=[i i    i+tx i+tx i];
                by=[j j+ty j+ty j    j];
            end      
       end       
       disp(['i=' num2str(i) ' -- j=' num2str(j) ' -- katsayý= ' num2str(r)]);
   end
end
plot(by,bx,'r','LineWidth',2);
gecenzaman=toc;
gecenzaman=round(gecenzaman,3);
