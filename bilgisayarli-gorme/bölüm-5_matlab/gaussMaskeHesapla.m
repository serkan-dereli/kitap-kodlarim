%çekirdek matris ortalamasını alır
function deger = gaussMaskeHesapla(M,cek)
    G3=(1/16)*[1 2 1;2 4 2;1 2 1];
    G5=(1/273)*[1 4 7 4 1;4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];
    
    deger=0;
    for i=1:cek
       for j=1:cek
           deger=deger+G3(i,j)*M(i,j);           
       end
    end    
end