clc;
clear all;
test1 = round(100*rand(1,10));
test2 = round(100*rand(1,10));
x=1:1:10;

%grafik çizdirme
plot(x,test1,x,test2);
xlabel('Görüntü Sayýsý');
ylabel('Piksel Sayýsý');
title('Görüntü baþýna bozuk piksel sayýsý');
legend('Test-1','Test-2');
grid on;