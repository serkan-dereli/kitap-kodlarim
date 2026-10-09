%bir dizi içerisinde belli bir değeri arar
%deger varsa sonuç 1, değilse 0 dır
%sablon_esleme1.m de kullanılır
function deger = scanPool(value,pool_array)    
    deger1=ismember(value-2,pool_array);
    deger2=ismember(value-1,pool_array);
    deger3=ismember(value,pool_array);
    deger4=ismember(value+1,pool_array);
    deger5=ismember(value+2,pool_array);
    deger=deger1+deger2+deger3+deger4+deger5;
end