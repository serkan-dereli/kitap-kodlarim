clc;
clear all;
orj=imread('subu.jpg');
dorj=im2double(orj);
[m,n,b]=size(orj);
for k=1:b
    for i=1:m
       for j=1:n
          if (dorj(i,j,k)<=0.125)
              renk4(i,j,k)=0;
          elseif (dorj(i,j,k)<=0.25)
              renk4(i,j,k)=0.143;
          elseif (dorj(i,j,k)<=0.375)
              renk4(i,j,k)=0.286;
          elseif (dorj(i,j,k)<=0.5)
              renk4(i,j,k)=0.429;
          elseif (dorj(i,j,k)<=0.625)
              renk4(i,j,k)=0.572;
          elseif (dorj(i,j,k)<=0.75)
              renk4(i,j,k)=0.715;
          elseif (dorj(i,j,k)<=0.875)
              renk4(i,j,k)=0.858;
          else
              renk4(i,j,k)= 1;            
          end      
       end
    end
end


figure(1);imshow(orj)
figure(2);imshow(im2uint8(renk4))

%subplot(1,4,1), imshow(a), title('576x480');
%subplot(1,4,2), imshow(b), title('288x240');
%subplot(1,4,3), imshow(c), title('144x120');
%subplot(1,4,4), imshow(d), title('72x60');