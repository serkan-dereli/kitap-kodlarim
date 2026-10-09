% sqrt(x) in yaklaþýk deðeri
% x_(n+1)=(1/2)(x_n+2/x_n)
clc
clear
x=20;% karekökü hesaplanan sayý
adim=1;%yaklaþým adýmý
i0=x/2;
k=0;
while k<1
    i1=(1/2)*(i0+x/i0);    
    disp(['adým: ' num2str(adim) ', i0: ' num2str(i0) ', i1: ' num2str(i1)])
    adim=adim+1;
    if i0-i1>0.1
        i0=i1;
    else
        k=1;
    end
end
disp(['fonksiyon: ' num2str(sqrt(x))]);%gerçek deðer
