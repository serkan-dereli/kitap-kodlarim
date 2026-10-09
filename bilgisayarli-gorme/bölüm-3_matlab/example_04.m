%subplot örneði
clc;
clear all;
test1 = round(100*rand(1,10));
test2 = round(100*rand(1,10));
x=1:1:10;

%grafik çizdirme
figure(1);
subplot(2,1,1);
plot(x,test1,'Color','k','LineWidth',2,'LineStyle','-','Marker','o');
ylabel('Piksel Sayýsý');
title('Bozuk Piksel Sayýsý');
legend('Test-1');
grid on;

subplot(2,1,2);
plot(x,test2,'Color','r','LineWidth',2,'LineStyle','-','Marker','o');
xlabel('Görüntü Sayýsý');
ylabel('Piksel Sayýsý');
legend('Test-2');
grid on;