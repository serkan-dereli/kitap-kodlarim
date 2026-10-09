clc;
clear all;
tic;
res=imread('sekiller.jpg');
res1=rgb2gray(res);
res2=im2bw(res1);
figure; imshow(res2);

%þekillerin tespiti
B=bwboundaries(res2);
[bilgi,number]=bwlabel(res2);
prop=regionprops(bilgi,'Area','Centroid','Perimeter');
hold on;

for n=1:number
    cent=prop(n).Centroid;
    x=cent(1);
    y=cent(2);
    area=prop(n).Area;
    perimeter=prop(n).Perimeter;
    met=(4*pi*area/perimeter^2)^2;
    text(x-10,y,strcat(num2str(n),'-\color{green}',num2str(met)),'FontSize',14);    
end

%adým-3
figure; imshow(res2);
hold on;
i=1;
for k=1:length(B)
    area=prop(k).Area;
    perimeter=prop(k).Perimeter;
    met=(4*pi*area/perimeter^2)^2;
    if met>0.7 && met<0.9
        bound=B{k};
        tespit{i}=B{k};
        i=i+1;
        plot(bound(:,2), bound(:,1),'r','LineWidth',2);
    end
end

%adým-4
[x1,y1]=size(res2);
img1=uint8(zeros(x1,y1));
for i=1:length(tespit)
    b=tespit{i};
    for k=1:length(b)
       img1(b(k,1),b(k,2))=255; 
    end
end
figure; imshow(img1);

%adým-5
img2=uint8(zeros(x1,y1));
for i=1:length(tespit)
   b=tespit{i};
   for x=min(b(:,1)):max(b(:,1))
      for y=min(b(:,2)):max(b(:,2))
          img2(x,y)=255;
      end
   end
end
figure; imshow(img2);
gecenzaman=toc;
gecenzaman=round(gecenzaman,3);





