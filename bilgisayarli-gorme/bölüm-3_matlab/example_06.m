clc;
clear all;
kok=0;
disp('II. Dereceden Denklem Kökleri Bulma');
disp('------------------------------------');
a=input('a Deðerini giriniz (ax2): ');
b=input('b Deðerini giriniz (bx): ');
c=input('c Deðerini giriniz (c): ');
delta = (b^2)-4*a*c;
if delta>0
    x1=((-1)*b+sqrt(delta))/2*a;
    x2=((-1)*b-sqrt(delta))/2*a;
    kok=1;
elseif delta==0
    x1=(-1)*b/2*a;
    x2=x1;
    kok=1;
else
    kok=0;
end
%--- ekrana yazdýrma iþlemi
disp('============================');
if kok==1    
    disp(['x1= ' num2str(x1) ' ve x2= ' num2str(x2)]);
else 
    disp(['Delta=' num2str(delta) ' olduðundan gerçek kök yoktur.']);
end

