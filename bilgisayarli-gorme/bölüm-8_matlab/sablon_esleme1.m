clc;
clear all;
tic;
pozKatsayi = 0;
pozKatDizi = zeros(50,1);
temp=imread('face_temp2.png');
list=imread('insanlar4.png');

tempG=rgb2gray(temp);
listG=rgb2gray(list);

[sat,sut]=size(listG);
[tx,ty]=size(tempG);

figure(1); imshow(listG); 
hold on;

r0=0.4;
r1=0.41;
i_pool = zeros(50,1);
j_pool = zeros(50,1);
ki = 1;
kj = 1;
for i=1:sat
   for j=1:sut
       if (i+tx<=sat && j+ty<=sut)
            ara=listG(i:i+(tx-1),j:j+(ty-1));
            r=corr2(tempG,ara);
            if r > r0
                %r0=r;
                bx=[i i    i+tx i+tx i];
                by=[j j+ty j+ty j    j];
                if scanPool(i,i_pool)==0 && scanPool(j,j_pool)==0               
                    pozKatsayi = pozKatsayi + 1;
                    pozKatDizi(pozKatsayi,1) = r;
                    
                    %komþu piksel konumlarýný havuza kaydet
                    for k=-2:2
                        i_pool(ki,1) = i+k;
                        j_pool(kj,1) = j+k;
                        ki=ki+1;
                        kj=kj+1;
                    end
                    
                    if r>r1
                        plot(by,bx,'g','LineWidth',1);
                    else
                        plot(by,bx,'r','LineWidth',1);
                    end
                    
                    disp(['i=' num2str(i) '. j=' num2str(j) '. r= ' num2str(r)]);
                end                 
            end      
       end
       %disp(['i=' num2str(i) ' -- j=' num2str(j) ' -- katsayý= ' num2str(r)]);
   end
end
gecenzaman=toc;
gecenzaman=round(gecenzaman,3);
