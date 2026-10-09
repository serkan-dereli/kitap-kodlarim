clc;
clear all;
tic;
pozitifEslesmeSayisi = 0;
pozitifEslesmeDizi = zeros(50,1);
sablon=imread('face_temp2.png');
kaynak=imread('insanlar4.png');

sablonGri=rgb2gray(sablon);
kaynakGri=rgb2gray(kaynak);

[sat,sut]=size(kaynakGri);
[tx,ty]=size(sablonGri);

figure(1); imshow(kaynakGri); 
hold on;

r0=0.3;
for i=1:sat
   for j=1:sut
       if (i+tx<=sat && j+ty<=sut)
            yama=kaynakGri(i:i+(tx-1),j:j+(ty-1));
            r=corr2(sablonGri,yama);
            if r > r0                
                pozitifEslesmeSayisi = pozitifEslesmeSayisi + 1;
                pozitifEslesmeDizi(pozitifEslesmeSayisi,1) = r;
                pozitifEslesmeDizi(pozitifEslesmeSayisi,2) = i;
                pozitifEslesmeDizi(pozitifEslesmeSayisi,3) = j;
                bx=[i i    i+tx i+tx i];
                by=[j j+ty j+ty j    j];
                plot(by,bx,'r','LineWidth',1);
                %disp(['i=' num2str(i) '. j=' num2str(j) '. r= ' num2str(r)]);
            end            
       end       
       %disp(['i=' num2str(i) ' -- j=' num2str(j) ' -- katsayý= ' num2str(r)]);
   end
end
gecenzaman=toc;
gecenzaman=round(gecenzaman,3);
