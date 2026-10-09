clc;
clear all;
r=imread('subu.jpg');
a=rgb2gray(r);
da=im2double(a);
[m,n]=size(a);
for i=1:m
   for j=1:n
      if (da(i,j)<=0.25)
          renk4(i,j)=0;
      elseif (da(i,j)<=0.5)
          renk4(i,j)=0.25;
      elseif (da(i,j)<=0.75)
          renk4(i,j)=0.5;
      else
          renk4(i,j)= 1;            
      end      
   end
end

figure(1);imshow(a)
figure(2);imshow(im2uint8(renk4))

%subplot(1,4,1), imshow(a), title('576x480');
%subplot(1,4,2), imshow(b), title('288x240');
%subplot(1,4,3), imshow(c), title('144x120');
%subplot(1,4,4), imshow(d), title('72x60');