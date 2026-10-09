%çekirdek matris ortalamasýný alýr
function ortalama = alchindusOrtalamaHesapla(x,cek)    
    top=0;
    for i=1:cek
       for j=1:cek
           top=double(x(i,j))+top;
       end
    end
    ortalama=top/(cek*cek);   
end