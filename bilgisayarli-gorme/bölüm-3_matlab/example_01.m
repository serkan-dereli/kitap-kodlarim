clc;
clear all;
deger = round(100*rand(1,10));
x=1:1:10;

%grafik çizdirme
plot(x,deger);
xlabel('Görüntü Sayýsý');
ylabel('Piksel Sayýsý');
title('Görüntü baþýna bozuk piksel sayýsý');
grid on;