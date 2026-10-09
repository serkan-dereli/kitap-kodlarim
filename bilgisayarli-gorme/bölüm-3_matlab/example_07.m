clc;
clear all;
test_gray=zeros(1,10);
test = round(255*rand(1,10));
[r,c]=size(test); %r=satır ve c=sütun
for i=1:c
    if test(1,i)>127
        test_gray(1,i)=1;
    else
        test_gray(1,i)=0;
    end
end