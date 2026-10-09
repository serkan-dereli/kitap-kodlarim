clc;
clear all;
test_gray=zeros(4,10);
test = round(255*rand(4,10));
[r,c]=size(test); %r=satır ve c=sütun
for i=1:r
    for j=1:c
        if test(i,j)>127
            test_gray(i,j)=1;
        else
            test_gray(i,j)=0;
        end
    end
end